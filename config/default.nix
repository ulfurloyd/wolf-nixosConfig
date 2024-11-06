{ config, pkg, ... }:
{
  imports = [
    ./hypr/hyprland.nix
    ./term/kitty.nix
    ./term/wezterm.nix
    ./shell/sh.nix
    ./nvim/vim.nix
  ];
}
