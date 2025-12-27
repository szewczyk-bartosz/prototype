{ config, pkgs, ... }:

let
  themes = import ../../themes;
  selectedTheme = themes.${config.mikoshi.theme};
in
{
  home.packages = with pkgs; [
    swww
  ];

  # Auto-start swww daemon and set wallpaper
  wayland.windowManager.hyprland.settings.exec-once = [
    "swww-daemon"
    "swww img ${selectedTheme.wallpaper}"
  ];
}
