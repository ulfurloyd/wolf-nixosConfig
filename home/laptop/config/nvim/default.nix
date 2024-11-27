{ config, pkgs, ... }:
{
  imports = [
    ./plugins
    ./vim.nix
    ./colorscheme.nix
    ./keymaps.nix
  ];
}
