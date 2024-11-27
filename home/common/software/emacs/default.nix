{
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [ epkgs.base16-theme ];
  };
}
