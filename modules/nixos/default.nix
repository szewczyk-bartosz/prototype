{ pkgs, config, ... }:

{
  imports = [
    ./sddm.nix
  ];

  config = {
    programs.hyprland.enable = true;
    environment.systemPackages = with pkgs; [
      vim
      git
      cowsay
    ];

    services.pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };
}
