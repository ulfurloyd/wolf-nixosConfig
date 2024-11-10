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
    };

    cursor = {
      package = pkgs.volantes-cursors;
      name = "volantes-cursors";
    };
  };
}
