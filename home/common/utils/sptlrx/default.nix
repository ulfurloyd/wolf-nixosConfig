{ pkgs, ... }:
{
  imports = [ ./sptlrx.nix ];
  home.packages = [ pkgs.sptlrx ];
  programs.sptlrx = {
    enable = false;

    settings = {
      player = "mpris";
      mpris.players = [ "cmus" ];
      local.folder = "~/Music";
    };
  };
}
