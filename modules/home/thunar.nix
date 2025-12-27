{ pkgs, ... }:

{
  # Thunar file manager
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  # Additional packages for Thunar functionality
  home.packages = with pkgs; [
    xfce.tumbler  # Thumbnail support
    ffmpegthumbnailer  # Video thumbnails
  ];

  # Enable thumbnail generation
  services.tumbler.enable = true;
}
