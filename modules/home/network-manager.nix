{ pkgs, ... }:

{
  # NetworkManager applet for GUI WiFi management
  home.packages = with pkgs; [
    networkmanagerapplet
  ];

  # Auto-start nm-applet
  wayland.windowManager.hyprland.settings.exec-once = [
    "nm-applet --indicator"
  ];
}
