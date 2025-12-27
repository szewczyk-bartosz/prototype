{ config, pkgs, ... }:
let
  themes = import ../../themes;
  selectedTheme = themes.${config.mikoshi.theme};
in
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      shell = "${pkgs.zsh}/bin/zsh";
      background = selectedTheme.colours.terminal.black;
      foreground = selectedTheme.colours.terminal.white;
      background_opacity = "0.85";

      font = selectedTheme.fonts.mono;

      color0 = selectedTheme.colours.terminal.black;
      color1 = selectedTheme.colours.terminal.red;
      color2 = selectedTheme.colours.terminal.green;
      color3 = selectedTheme.colours.terminal.yellow;
      color4 = selectedTheme.colours.terminal.blue;
      color5 = selectedTheme.colours.terminal.magenta;
      color6 = selectedTheme.colours.terminal.cyan;
      color7 = selectedTheme.colours.terminal.white;
      color8 = selectedTheme.colours.terminal.brightBlack;
      color9 = selectedTheme.colours.terminal.brightRed;
      color10 = selectedTheme.colours.terminal.brightGreen;
      color11 = selectedTheme.colours.terminal.brightYellow;
      color12 = selectedTheme.colours.terminal.brightBlue;
      color13 = selectedTheme.colours.terminal.brightMagenta;
      color14 = selectedTheme.colours.terminal.brightCyan;
      color15 = selectedTheme.colours.terminal.brightWhite;
    };

  };

}
