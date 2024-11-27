{ pkgs, config, userSettings, ... }:
{
  wayland.windowManager.river = {
    enable = true;
    xwayland.enable = true;
  };
}
