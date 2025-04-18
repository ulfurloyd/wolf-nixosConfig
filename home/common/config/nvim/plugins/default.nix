{ config, ... }:
{
  imports = [
    # colorizer isn't available in 24.11
    # ./colorizer.nix
    ./comment.nix
    ./completions.nix
    ./dap.nix
    ./harpoon.nix
    ./image-nvim.nix
    ./lazygit.nix
    ./lsp.nix
    ./lualine.nix
    ./markview.nix
    ./neo-tree.nix
    ./neocord.nix
    ./nvim-snippets.nix
    ./obsidian.nix
    ./oil.nix
    ./startify.nix
    ./telescope.nix
    ./transparent.nix
    ./treesitter.nix
    ./web-devicons.nix
    ./which-key.nix
  ];
}
