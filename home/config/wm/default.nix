{ config, pkgs, ... }:
{
  imports = [
    ./bspwm.nix
    ./hyprland.nix
    ./river.nix
  ];
}
