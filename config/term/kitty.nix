{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "FiraCode-Regular";
      font_size = "13.0";
      enable_audio_bell = "no";
      confirm_os_window_close = "0";
      # background_opacity = "0.8";
      shell = "zsh";
    };
  };
}
