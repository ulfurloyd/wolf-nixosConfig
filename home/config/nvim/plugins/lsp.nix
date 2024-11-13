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
          nixd.enable = true;
        };
        keymaps = {
          silent = true;
          lspBuf = {
            gd = {
              action = "definition";
              desc = "Goto Definition";
            };
            gr = {
              action = "references";
              desc = "Goto References";
            };
            gD = {
              action = "declaration";
              desc = "Goto Declaration";
            };
            gI = {
              action = "implementation";
              desc = "Goto Implementation";
            };
            gT = {
              action = "type_definition";
              desc = "Type Definition";
            };
            "<leader>cr" = {
              action = "rename";
              desc = "Rename";
            };
          };
        };
      };
    };
  };
}
