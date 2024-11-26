{ pkgs, config, userSettings, ... }:
{
  stylix = {
    enable = true;
    image = ../../themes/${userSettings.laptopTheme}/wallpaper.png;
    polarity = "dark";
  };
}
