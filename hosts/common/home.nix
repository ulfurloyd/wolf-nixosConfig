{ config, pkgs, pkgsUnstable, userSettings, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
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
    hyprpaper
    grim
    slurp
    grimblast
    inputs.hyprland-contrib.packages.${pkgs.system}.scratchpad
    inputs.wofi-power-menu.packages.${pkgs.system}.wofi-power-menu
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.lazygit.enable = true;

  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [ epkgs.base16-theme ];
  };

  programs.spicetify = {
    enable = true;
    spicetifyPackage = inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}".spicetify-cli;
    enabledExtensions = with spicePkgs.extensions; [ ];
    # theme = {
    #   name = "base16-spotify";
    #   src = pkgs.fetchFromGithub {
    #     owner = "Misterio77";
    #     repo = "base16-spotify";
    #     rev = "";
    #     hash = "";
    #   };
    # };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
