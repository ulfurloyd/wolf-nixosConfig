{ config, ... }:
{
  imports = [
    ./comment.nix
    ./completions.nix
    ./harpoon.nix
    ./image-nvim.nix
    ./lazygit.nix
    ./lsp.nix
    ./lualine.nix
    ./markview.nix
    ./neo-tree.nix
    ./neocord.nix
    ./oil.nix
    ./startify.nix
    ./telescope.nix
    ./transparent.nix
    ./treesitter.nix
  ];
}
