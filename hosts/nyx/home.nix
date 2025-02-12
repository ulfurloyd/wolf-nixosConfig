{ pkgs, ... }:
{
  imports = [
    ../../home/nyx
    ../../home/common
  ];

  home.packages = with pkgs; [
    nodejs_22
    sshfs
    shadps4
    xwayland-satellite
  ];
}
