{ ... }:

{
  # Enable NetworkManager for WiFi management
  networking.networkmanager.enable = true;

  # Disable wpa_supplicant as it conflicts with NetworkManager
  networking.wireless.enable = false;
}
