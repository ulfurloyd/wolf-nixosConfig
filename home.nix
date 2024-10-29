{ config, pkgs, ... }:

{

  imports = [
    ./config/shell/sh.nix
    ./config/nvim/vim.nix
    ./config/term/kitty.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "wolf";
  home.homeDirectory = "/home/wolf";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    nodejs_22
    gh
    tmux
    kitty
    fira
    fira-code
    onefetch
    vesktop
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
