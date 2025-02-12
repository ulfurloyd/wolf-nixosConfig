{ config, pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../stylix/nyx
    ../../system
    ../../modules/nyx
  ];
  
  programs.niri.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  networking.hostName = "nyx";

  environment.systemPackages = with pkgs; [ ];
}
