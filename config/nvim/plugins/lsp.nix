{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;

        servers = {
          html.enable = true;
          cssls.enable = true;
          lua-ls.enable = true;
          bashls.enable = true;
          clangd.enable = true;
          tsserver.enable = true;
          pyright.enable = true;
        };
      };
    };
  };
}
