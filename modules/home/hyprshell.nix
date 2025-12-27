{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprshell
  ];
}
