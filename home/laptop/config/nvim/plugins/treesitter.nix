{ pkgs, ... }:
{
  programs.nixvim.plugins.treesitter = {
    enable = true;

    # settings = {
    #   auto_install = true;
    #   indent = {
    #     enable = true;
    #   };
    #   highlight = {
    #     enable = true;
    #   };
    # };
    folding = false;
    nixvimInjections = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
  };
}
