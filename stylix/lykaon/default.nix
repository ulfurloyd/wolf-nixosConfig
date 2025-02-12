{ pkgs, config, userSettings, ... }:
{
  stylix = {
    enable = true;
    image = ../../themes/${userSettings.lykaonTheme}/wallpaper.png;
    polarity = "dark";
  };
}
