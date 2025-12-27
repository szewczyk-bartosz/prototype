{ pkgs, ... }:

{
  # NetworkManager applet for GUI WiFi management
  # We don't show the tray icon, but keep the package for nm-connection-editor
  home.packages = with pkgs; [
    networkmanagerapplet
  ];
}
