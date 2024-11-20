{ pkgs, config, userSettings, ... }:
{
  stylix = {
    enable = true;
    image = /home/${userSettings.username}/.dotfiles/themes/${userSettings.desktopTheme}/wallpaper.png;
    polarity = "dark";
  };
}
