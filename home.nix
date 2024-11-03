{ config, pkgs, ... }:

{

  imports = [
    ./config/shell/sh.nix
    ./config/nvim/vim.nix
    ./config/term/kitty.nix
    # ./config/tmux/tmux.nix
  ];

  home.username = "wolf";
  home.homeDirectory = "/home/wolf";

  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    nodejs_22
    gh
    tmux
    kitty
    nerdfonts
    fira
    fira-code
    fira-code-symbols
    onefetch
    vesktop
    ripgrep
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.lazygit = {
    enable = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
