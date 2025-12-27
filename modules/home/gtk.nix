{ config, pkgs, ... }:

let
  themes = import ../../themes;
  selectedTheme = themes.${config.mikoshi.theme};
in
{
  gtk = {
    enable = true;

    iconTheme = {
      name = selectedTheme.icon;
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = selectedTheme.cursor;
      package = pkgs.bibata-cursors;
    };

    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };

    font = {
      name = selectedTheme.fonts.main;
      size = selectedTheme.fonts.size;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };

  # Qt theming to match GTK
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "adwaita-dark";
  };

  home.packages = with pkgs; [
    papirus-icon-theme
    bibata-cursors
    adwaita-icon-theme
  ];

  # Set environment variables for consistent theming
  home.sessionVariables = {
    GTK_THEME = "Adwaita-dark";
    XCURSOR_THEME = selectedTheme.cursor;
  };
}
