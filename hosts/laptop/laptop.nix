{ config, pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../stylix
    ../../system
  ];

  networking.hostName = "wolfNix";
}
