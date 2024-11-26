{pkgs, config, userSettings, ...}:
let
  imagePath = ../../../themes/${userSettings.laptopTheme}/wallpaper.png;
in
{
  stylix = {
    enable = true;

    image = imagePath;

    polarity = "dark";

    opacity = {
      terminal = 0.6;
      desktop = 0.6;
    };

    targets = {
      kitty = { enable = true; };

      rofi = {
        enable = true;
        # fontSize = 14; # this option doesn't exist yet
      };

      nixvim = {
        enable = true;
        # plugin = "base16-nvim";
      };

      waybar = {
        enableRightBackColors = false;
      };

      # spicetify = { enable = true; };

      emacs = { enable = true; };
      
    };

    fonts = {
      serif = {
        package = pkgs.fira;
        name = "Fira Serif";
      };

      sansSerif = {
        package = pkgs.fira-sans;
        name = "Fira Sans Serif";
      };

      monospace = {
        package = pkgs.fira-code;
        name = "Fira Code";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        applications = 12;
      };
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 20;
    };
  };
}
