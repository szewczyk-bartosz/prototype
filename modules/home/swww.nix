{ pkgs, ... }:

{
  home.packages = with pkgs; [
    swww
  ];

  # Auto-start swww daemon
  wayland.windowManager.hyprland.settings.exec-once = [
    "swww-daemon"
  ];
}
