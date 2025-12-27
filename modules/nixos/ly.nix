{ config, pkgs, lib, ... }:

{
  # Use ly - a TUI display manager with cool matrix rain animation
  # Much simpler than SDDM and fits the cyberpunk aesthetic perfectly
  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "matrix";  # Matrix-style rain animation (very cyberpunk!)
      # Other options: "doom" for classic doom fire

      # Custom message displayed at the top of the login box
      box_title = "Wake the fuck up Samurai, we've got a city to burn";
    };
  };

  # Disable other display managers
  services.xserver.displayManager.sddm.enable = lib.mkForce false;
}
