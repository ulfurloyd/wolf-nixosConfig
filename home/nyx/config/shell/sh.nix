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

    ## git aliases
    # basic commands
    gs = "git status";
    ga = "git add";
    gaa = "git add .";
    gc = "git commit";
    gcm = "git commit -m";
    gp = "git push";
    gpl = "git pull";
    gi = "git init";
    gcl = "git clone";

    # branching
    gb = "git branch";
    gba = "git branch -a";
    gco = "git checkout";
    gcb = "git checkout -b";
    gsw = "git switch";
    gswc = "git switch -c";

    # logs and diffs
    gl = "git log --oneline --graph --decorate";
    gd = "git diff";
    gds = "git diff --staged";
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
