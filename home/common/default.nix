{
  imports = [
    ./config
    ./software
    ./sptlrx.nix
    ./utils
  ];
  programs.sptlrx = {
    enable = true;
    settings.player = "mpris";
  };
}
