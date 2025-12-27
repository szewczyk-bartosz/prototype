{ config, ... }:

{
  imports = [
    ./waybar.nix
    ./fonts.nix
    ./brave.nix
    ./hyprland.nix
    ./kitty.nix
    ./nixvim
    ./wofi.nix
    ./mako.nix
    ./hyprlock.nix
    ./thunar.nix
    ./yazi.nix
    ./network-manager.nix
    ./claude-code.nix
    ./git.nix
    ./hyprshell.nix
    ./grimblast.nix
    ./copyq.nix
    ./swww.nix
    ./gtk.nix
    ./rust.nix
    ./python.nix
  ];
}
