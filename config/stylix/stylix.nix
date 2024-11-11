{pkgs, config, ...}:
let
  imagePath = "../../../themes/bleak-cabin/bleak_cabin.png";
in
{
  stylix = {
    enable = true;

    # image = ../../wallpapers/river_to_castle_theme_blue.jpg;
    image = ./. + imagePath;

    polarity = "dark";

    targets = {
      kitty = { enable = true; };
      rofi = {
        enable = false;
        # fontSize = 14; # this option doesn't exist yet
      };
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
        name = "Fira Monospace";
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
      size = 12;
    };
  };
}
