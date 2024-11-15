{ pkgs, config, userSettings, ... }:
{
  stylix = {
    enable = true;
    image = /home/${userSettings.username}/.dotfiles/themes/${userSettings.theme}/wallpaper.png;
    polarity = "dark";
  };
}
