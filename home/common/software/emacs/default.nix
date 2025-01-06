{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [epkgs.vterm ];
  };
  
#   home.packages = with pkgs; [ 
#     libvterm
#     libtool
#     cmake
#   ];
}
