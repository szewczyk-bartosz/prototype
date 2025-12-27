{ config, ... }:

let
  themes = import ../../themes;
  selectedTheme = themes.${config.mikoshi.theme};
in 
{
  imports = [ ./hyprland.nix ./kitty.nix];

  _module.args.selectedTheme = selectedTheme;
}
