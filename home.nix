{ config, pkgs, ... }:

{

  imports = [
    ./sh.nix
    ./config/nvim/vim.nix
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
    vesktop
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.kitty = {
    enable = true;
    settings = {
      font_family = "FiraCode-Regular";
      font_size = "13.0";
      enable_audio_bell = "no";
      confirm_os_window_close = "0";
      background_opacity = "0.8";
      shell = "zsh";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
