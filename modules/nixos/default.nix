{ lib, pkgs, config, home-manager, ... }:

{
  config = {
    programs.hyprland.enable = true;
    environment.systemPackages = with pkgs; [
      vim
      git
    ];
  };
}
