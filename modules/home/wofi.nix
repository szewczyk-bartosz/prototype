{ config, ... }:

let
  themes = import ../../themes;
  selectedTheme = themes.${config.mikoshi.theme};
in
{
  programs.wofi = {
    enable = true;
    settings = {
      width = 600;
      height = 400;
      location = "center";
      show = "drun";
      prompt = "Search...";
      filter_rate = 100;
      allow_markup = true;
      no_actions = true;
      halign = "fill";
      orientation = "vertical";
      content_halign = "fill";
      insensitive = true;
      allow_images = true;
      image_size = 40;
      gtk_dark = true;
    };

    style = ''
      window {
        margin: 0px;
        border: 2px solid ${selectedTheme.colours.primary};
        background-color: ${selectedTheme.colours.bg};
        border-radius: 8px;
      }

      #input {
        margin: 5px;
        border: 1px solid ${selectedTheme.colours.border};
        color: ${selectedTheme.colours.fg};
        background-color: ${selectedTheme.colours.bgAlt};
        border-radius: 4px;
        padding: 8px;
      }

      #inner-box {
        margin: 5px;
        border: none;
        background-color: ${selectedTheme.colours.bg};
      }

      #outer-box {
        margin: 5px;
        border: none;
        background-color: ${selectedTheme.colours.bg};
      }

      #scroll {
        margin: 0px;
        border: none;
      }

      #text {
        margin: 5px;
        border: none;
        color: ${selectedTheme.colours.fg};
      }

      #entry {
        padding: 5px;
        border-radius: 4px;
      }

      #entry:selected {
        background-color: ${selectedTheme.colours.primary};
        color: ${selectedTheme.colours.onPrimary};
      }

      #text:selected {
        color: ${selectedTheme.colours.onPrimary};
      }
    '';
  };
}
