{ config, pkgs, pkgsUnstable, userSettings, inputs, ... }:
let
  scratchpad = inputs.hyprland-contrib.packages.${pkgs.system}.scratchpad;
  swww = inputs.swww.packages.${pkgs.system}.swww;
in
{
  nixpkgs.config.allowUnfree = true;

  home.username = userSettings.username;
  home.homeDirectory = "/home/${userSettings.username}";

  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    gh
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
    scratchpad
    swww
    legcord
    gimp
    devenv
    inputs.fastanime.packages."${system}".default
    # inputs.ghostty.packages."${system}".default
    lrcget
    # inputs.fum.packages."${system}".default
    conda
    uv
    virtualbox
    vagrant
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
