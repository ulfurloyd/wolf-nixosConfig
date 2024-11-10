{ config, pkgs, ... }:
{
  imports = [
    ./hyprland.nix
    ./bspwm.nix
    ./polybar.nix
  ];
}
