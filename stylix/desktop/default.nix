{ pkgs, config, userSettings, ... }:
{
  stylix = {
    enable = true;
    image = ../../themes/${userSettings.desktopTheme}/wallpaper.png;
    polarity = "dark";
  };
}
