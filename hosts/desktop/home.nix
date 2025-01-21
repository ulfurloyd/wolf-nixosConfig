{ pkgs, ... }:
{
  imports = [
    ../../home/desktop
    ../../home/common
  ];

  home.packages = with pkgs; [
    nodejs_22
    sshfs
    shadps4
  ];
}
