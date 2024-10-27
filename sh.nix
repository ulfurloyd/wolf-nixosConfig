{ config, pkgs, ... }:

let
  myAliases = {
    nf = "neofetch";
    pf = "pfetch";
    ls = "exa -lah";
    v = "nvim";
    ani = "ani-cli";
    myscrot = "scrot ~/Pictures/Screenshots/%b%d::%H%M%S.png";

    # fuzzy finder
    vif = "nvim $(fzf)";

    # zoxide
    # cd = "z";

    # tmux
    t = "tmux";
    };
in
{
  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };
}
