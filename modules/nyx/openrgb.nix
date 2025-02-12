{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ openrgb-with-all-plugins ];

  services.hardware.openrgb = {
    enable = true;
    package = pkgs.openrgb-with-all-plugins;
    motherboard = "amd";
    server.port = 6742;
  };
}
