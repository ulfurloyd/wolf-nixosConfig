{ pkgs, config, userSettings, ... }:
{
  stylix = {
    enable = true;
    image = ../../themes/${userSettings.nyxTheme}/wallpaper.png;
    polarity = "dark";
  };
}
