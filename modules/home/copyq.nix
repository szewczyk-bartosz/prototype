{ pkgs, ... }:

{
  home.packages = with pkgs; [
    copyq
  ];

  # Auto-start CopyQ
  wayland.windowManager.hyprland.settings.exec-once = [
    "copyq --start-server"
  ];
}
