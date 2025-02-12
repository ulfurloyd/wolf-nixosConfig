{ userSettings, config, pkgs, inputs, ... }:
{
  programs.ghostty = {
    enable = true;
    package = inputs.ghostty-pkg.packages."${pkgs.system}".default;

    shellIntegration.enable = false;
    shellIntegration.enableZshIntegration = true;

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

    keybindings = {
      "alt+w" = "close_surface";
      "alt+t" = "new_tab";
      "alt+tab" = "previous_tab";
      "alt+\\" = "toggle_tab_overview";
      "alt+enter>alt+h" = "new_split:down";
      "alt+enter>alt+j" = "new_split:up";
      "alt+enter>alt+k" = "new_split:right";
      "alt+enter>alt+l" = "new_split:left";
      "alt+h" = "goto_split:left";
      "alt+j" = "goto_split:bottom";
      "alt+k" = "goto_split:top";
      "alt+l" = "goto_split:right";
      "alt+f" = "toggle_split_zoom";
    };

    extraConfig = "command = zsh";
  };
}
