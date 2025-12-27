{ config, pkgs, ... }:

let
  themes = import ../../themes;
  selectedTheme = themes.${config.mikoshi.theme};

  # Build custom SDDM theme
  mikoshiSddmTheme = pkgs.stdenv.mkDerivation {
    name = "mikoshi-sddm-theme";
    src = ../../sddm-theme;

    buildInputs = [ pkgs.libsForQt5.qt5.qtgraphicaleffects ];

    installPhase = ''
      mkdir -p $out/share/sddm/themes/mikoshi
      cp -r $src/* $out/share/sddm/themes/mikoshi/

      # Generate theme.conf with colors from selected theme
      cat > $out/share/sddm/themes/mikoshi/theme.conf << EOF
      ${import ../../sddm-theme/theme.conf.nix {
        theme = selectedTheme;
        wallpaper = "${selectedTheme.wallpaper}";
      }}
      EOF
    '';
  };
in
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "mikoshi";

    settings = {
      Theme = {
        Current = "mikoshi";
        CursorTheme = selectedTheme.cursor;
      };

      General = {
        InputMethod = "";
      };
    };
  };

  # Install custom SDDM theme
  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtquickcontrols2
    mikoshiSddmTheme
  ];
}
