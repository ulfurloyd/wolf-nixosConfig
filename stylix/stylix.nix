{ pkgs, config, userSettings, ... }:
{
  stylix = {
    enable = true;
    image = /home/${userSettings.username}/.dotfiles/themes/bleak-cabin/wallpaper.png;
    polarity = "dark";
  };
}
