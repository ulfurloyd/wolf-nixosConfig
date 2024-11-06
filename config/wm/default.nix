{ config, pkgs, ... }:
{
  imports = [
    ./hyprland.nix
    ./dwm.nix
  ];
}
