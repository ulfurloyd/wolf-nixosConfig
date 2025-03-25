{ pkgsUnstable, ... }:
{
  home.packages = [ pkgsUnstable.fum ];
  home.file.".config/fum/config.jsonc".source = ./config.jsonc;
}
