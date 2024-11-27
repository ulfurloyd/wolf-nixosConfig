{ config, pkgs, ... }:

let
  myAliases = {
    nf = "neofetch";
    pf = "pfetch";
    ls = "exa -lah";
    v = "nvim";
    ani = "ani-cli";
    myscrot = "scrot ~/Pictures/Screenshots/%b%d::%H%M%S.png";

    # yazi
    y = "yazi";

    # fuzzy finder
    vif = "nvim $(fzf)";

    # zoxide
    cd = "z";

    # tmux
    t = "tmux";

    gg = "lazygit";
    tree = "tre -e automatic";
    };
in
{
  home.packages = with pkgs; [
    zsh
    zinit
    zoxide
    eza
    neofetch
    pfetch
    fzf
  ];

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  };

  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };

  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
  };
}
