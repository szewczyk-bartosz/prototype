{ config, ... }:

{
  imports = [
    ./waybar.nix
    ./hyprland.nix
    ./kitty.nix
    ./nixvim
    ./wofi.nix
    ./mako.nix
    ./hyprlock.nix
    ./thunar.nix
    ./yazi.nix
    ./hyprshell.nix
    ./grimblast.nix
    ./copyq.nix
    ./swww.nix
    ./zsh.nix
    ./starship.nix
  ];
}
