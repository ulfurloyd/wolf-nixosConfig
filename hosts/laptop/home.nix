{ pkgs, ... }:
{
  imports = [
    ../../home
    ../../home/stylix/laptop
    ../../home/utils/waybar/laptop.nix
  ];

  home.packages = with pkgs; [
  ];
}
