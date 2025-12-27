{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprshell
  ];
  wayland.windowManager.hyprland.settings.exec-once = [
    "hyprshell run &"
  ];
}
