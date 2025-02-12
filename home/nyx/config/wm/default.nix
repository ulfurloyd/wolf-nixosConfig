{ config, pkgs, ... }:
{
  imports = [
    ./bspwm.nix
    ./hyprland.nix
    ./niri.nix
    ./river.nix
  ];
}
