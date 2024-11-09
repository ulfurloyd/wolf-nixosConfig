{pkgs, config, ...}:
{
  stylix = {
    enable = true;

    image = ../../wallpapers/bleak_cabin.png;

    polarity = "dark";

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
  };
}
