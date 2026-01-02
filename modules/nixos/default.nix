{ pkgs, config, ... }:

{
  imports = [
    ./ly.nix
    ./networkmanager.nix
  ];

  config = {
    programs.hyprland.enable = true;
    environment.systemPackages = with pkgs; [
      vim
      git
      cowsay
    ];

    # Set keyboard layout system-wide
    console.keyMap = config.mikoshi.keyboardLayout;

    services.tumbler.enable = true;
    services.pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };
}
