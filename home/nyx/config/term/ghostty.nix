{ userSettings, config, pkgs, inputs, ... }:
{
  programs.ghostty = {
    enable = true;

    enableZshIntegration = true;

    settings = {
      font-family = "Fira Mono";
      font-size = 14;

      foreground = "white";

      background = "black";
      background-opacity = 0.6;
      background-blur-radius = 20;

      window-theme = "dark";
      window-decoration = false;
      adw-toolbar-style = "flat";
      gtk-tabs-location = "top";
    };
  };
}
