{ config, pkgs, ... }:
{
  imports = [
    ./bspwm.nix
    ./hyprland.nix
    ./niri.nix
    ./qtile.nix
    ./river.nix
  ];
}
