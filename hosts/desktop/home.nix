{ pkgs, ... }:
{
  imports = [
    ../../home
    ../../home/stylix/desktop
  ];

  home.packages = with pkgs; [
    nodejs_22
    sshfs
  ];
}
