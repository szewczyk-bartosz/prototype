{ pkgs, ... }:

{
  home.packages = with pkgs; [
    copyq
  ];

  # Auto-start CopyQ without tray icon
  wayland.windowManager.hyprland.settings.exec-once = [
    "copyq --start-server hide"
  ];
}
