{ config, ... }:

let
  themes = import ../../themes;
  selectedTheme = themes.${config.mikoshi.theme};
in
{
  services.mako = {
    enable = true;

    # Appearance
    backgroundColor = selectedTheme.colours.bg;
    textColor = selectedTheme.colours.fg;
    borderColor = selectedTheme.colours.primary;
    progressColor = "over ${selectedTheme.colours.primary}";

    # Border and padding
    borderSize = 2;
    borderRadius = 8;
    padding = "12";
    margin = "10";

    # Position
    anchor = "top-right";

    # Dimensions
    width = 350;
    height = 150;

    # Behavior
    defaultTimeout = 5000;
    ignoreTimeout = false;

    # Icons
    iconPath = "${selectedTheme.icon}";
    maxIconSize = 48;

    # Font
    font = "${selectedTheme.fonts.main} ${toString selectedTheme.fonts.size}";

    # Grouping
    groupBy = "app-name";

    # Extra urgency-specific settings
    extraConfig = ''
      [urgency=low]
      border-color=${selectedTheme.colours.info}

      [urgency=normal]
      border-color=${selectedTheme.colours.primary}

      [urgency=critical]
      border-color=${selectedTheme.colours.error}
      background-color=${selectedTheme.colours.error}
      text-color=${selectedTheme.colours.onError}
    '';
  };
}
