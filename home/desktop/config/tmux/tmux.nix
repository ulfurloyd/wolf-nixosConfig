{ pkgs, ... }:

{
  programs.tmux = {
    enable = false;
    terminal = "screen-256color";

    shell = "${pkgs.zsh}/bin/zsh";
    baseIndex = 1;

    mouse = true;

    prefix = "C-space";

    historyLimit = 100000;

    plugins = with pkgs; [
      tmuxPlugins.resurrect
      tmuxPlugins.continuum
      tmuxPlugins.catppuccin
    ];

    extraConfig = ''
      set-option -sa terminal-overrides ",xterm*:Tc"

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      bind -n M-H previous-window
      bind -n M-L next-window

      set -g @resurrect-strategy-nvim 'session'
      set -g @continuum-restore 'on'

      set -g @catppuccin_flavour 'mocha'
    '';

# ---------------------------

    # plugins = with pkgs; [
    #   {
    #     plugin = tmuxPlugins.resurrect;
    #     extraConfig = ''
    #       set -g @resurrect-strategy-nvim 'session'
    #     '';
    #   }
    #   {
    #     plugin = tmuxPlugins.continuum;
    #     extraConfig = ''
    #       set -g @continuum-restore 'on'
    #     '';
    #   }
    # ];
  };
}
