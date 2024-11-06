{ config, pkgs, ... }:
{
  imports = [
    ./vim.nix
    ./colorscheme.nix
    ./keymaps.nix
  ];
}
