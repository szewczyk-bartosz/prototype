{ config, pkgs, ... }:

let
  themes = import ../../themes;
  selectedTheme = themes.${config.mikoshi.theme};
in
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "breeze";

    settings = {
      Theme = {
        Current = "breeze";
        CursorTheme = selectedTheme.cursor;
        Font = selectedTheme.fonts.main;
      };

      General = {
        InputMethod = "";
      };
    };
  };

  # Install SDDM theme
  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtgraphicaleffects
  ];
}
