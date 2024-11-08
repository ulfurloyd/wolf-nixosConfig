{ config, pkg, ... }:
{
  imports = [
    ./wm/hyprland.nix
    ./wm/bspwm.nix
    ./wm/polybar.nix
    ./term/kitty.nix
    ./term/wezterm.nix
    ./shell/sh.nix
    ./nvim/vim.nix
  ];
}
