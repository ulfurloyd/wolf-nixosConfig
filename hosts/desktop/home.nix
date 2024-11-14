{ pkgs, ... }:
{
  imports = [ ../../home ];

  home.packages = with pkgs; [
    nodejs_22
  ];
}
