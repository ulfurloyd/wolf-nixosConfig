{ pkgs, ... }:
{
  programs.cmus = {
    enable = true;
  };
  home.packages = [ pkgs.kid3 ];
}
