{ pkgs, config, userSettings, ... }:
{
  stylix = {
    enable = true;
    image = /home/${userSettings.username}/.dotfiles/themes/${userSettings.laptopTheme}/wallpaper.png;
    polarity = "dark";
  };
}
