{ pkgs, ... }:
{
  imports = [
    ../../home
    ../../home/stylix/laptop
  ];

  home.packages = with pkgs; [
  ];
}
