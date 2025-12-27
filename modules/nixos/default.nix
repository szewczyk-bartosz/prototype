{ pkgs, config, ... }:

{
  imports = [
    ./sddm.nix
    ./networkmanager.nix
  ];

  config = {
    programs.hyprland.enable = true;
    environment.systemPackages = with pkgs; [
      vim
      git
      cowsay
    ];

    services.tumbler.enable = true;
    services.pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };
}
