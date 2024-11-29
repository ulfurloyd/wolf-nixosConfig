{ config, pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../stylix/desktop
    ../../system
    ../../modules/desktop
  ];

  # Enable networking
  networking.networkmanager.enable = true;

  networking.hostName = "wolfNix";

  environment.systemPackages = with pkgs; [ ];
}
