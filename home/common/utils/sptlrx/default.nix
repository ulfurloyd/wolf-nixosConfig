{ pkgs, pkgsUnstable, ... }:
{
  imports = [ ./sptlrx.nix ];
  home.packages = [ pkgsUnstable.sptlrx ];
  home.file.".config/sptlrx/config.yaml".source = ./config.yaml;
  programs.sptlrx = {
    enable = false;

    settings = {
      player = "mpris";
      mpris.players = [ "cmus" ];
      local.folder = "~/Music";
    };
  };
}
