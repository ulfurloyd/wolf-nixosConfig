{ config, pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../stylix
    ../../system
    ../../modules/desktop
  ];

  networking.hostName = "wolfNix";

  environment.systemPackages = with pkgs; [ ];
}
