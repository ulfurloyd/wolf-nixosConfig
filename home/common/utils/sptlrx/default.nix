{ pkgs, ... }:
{
  home.packages = [ pkgs.sptlrx ];

  home.file.".config/sptlrx/config.yaml".source = ./config.yaml;
}
