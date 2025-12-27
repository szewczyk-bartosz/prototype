{ pkgs, ... }:

{
  home.packages = with pkgs; [
    grimblast
    slurp  # Region selection
    grim   # Screenshot utility
  ];
}
