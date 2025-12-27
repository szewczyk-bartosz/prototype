{ config, ... }:

let
  themes = import ../../themes;
  selectedTheme = themes.${config.mikoshi.theme};
in
{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading_bar = false;
        hide_cursor = true;
        grace = 0;
        no_fade_in = false;
        no_fade_out = false;
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 7;
          noise = 0.0117;
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
        }
      ];

      input-field = [
        {
          size = "300, 50";
          outline_thickness = 2;
          dots_size = 0.2;
          dots_spacing = 0.15;
          dots_center = true;
          outer_color = "rgb(${builtins.substring 1 (-1) selectedTheme.colours.primary})";
          inner_color = "rgb(${builtins.substring 1 (-1) selectedTheme.colours.bg})";
          font_color = "rgb(${builtins.substring 1 (-1) selectedTheme.colours.fg})";
          fade_on_empty = false;
          placeholder_text = "<i>Password...</i>";
          hide_input = false;
          check_color = "rgb(${builtins.substring 1 (-1) selectedTheme.colours.warning})";
          fail_color = "rgb(${builtins.substring 1 (-1) selectedTheme.colours.error})";
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          capslock_color = "rgb(${builtins.substring 1 (-1) selectedTheme.colours.warning})";
          position = "0, -20";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        # Time
        {
          text = "cmd[update:1000] echo \"<b>$(date +\"%H:%M\")</b>\"";
          color = "rgb(${builtins.substring 1 (-1) selectedTheme.colours.fg})";
          font_size = 90;
          font_family = selectedTheme.fonts.main;
          position = "0, 150";
          halign = "center";
          valign = "center";
        }
        # Date
        {
          text = "cmd[update:1000] echo \"<b>$(date +\"%A, %d %B %Y\")</b>\"";
          color = "rgb(${builtins.substring 1 (-1) selectedTheme.colours.fgAlt})";
          font_size = 20;
          font_family = selectedTheme.fonts.main;
          position = "0, 80";
          halign = "center";
          valign = "center";
        }
        # User
        {
          text = "    $USER";
          color = "rgb(${builtins.substring 1 (-1) selectedTheme.colours.fg})";
          font_size = 16;
          font_family = selectedTheme.fonts.main;
          position = "0, -100";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
