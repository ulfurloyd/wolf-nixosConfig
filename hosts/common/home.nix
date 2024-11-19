{ config, pkgs, pkgsUnstable, userSettings, inputs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home.username = userSettings.username;
  home.homeDirectory = "/home/${userSettings.username}";

  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    gh
    tmux
    kitty
    nerdfonts
    fira
    fira-code
    fira-code-symbols
    onefetch
    discord
    ripcord
    vesktop
    dorion
    ripgrep
    tre-command
    btop
    obsidian
    ani-cli
    ncdu
    python3
    python311Packages.dbus-python
    wowup-cf
    whatsapp-for-linux
    scrot
    gowall
    egl-wayland
    grim
    slurp
    grimblast
    inputs.hyprland-contrib.packages.${pkgs.system}.scratchpad
    inputs.wofi-power-menu.packages.${pkgs.system}.wofi-power-menu
    inputs.swww.packages.${pkgs.system}.swww
    legcord
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
