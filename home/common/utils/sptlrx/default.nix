{
  imports = [ ./sptlrx.nix ];
  programs.sptlrx = {
    enable = true;

    settings = {
      player = "mpris";
      mpris.players = [ "cmus" ];
      local.folder = "~/Music";
    };
  };
}
