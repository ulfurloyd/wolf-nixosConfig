{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;

        servers = {
          bashls.enable = true;
          clangd.enable = true;
          cmake.enable = true;
          cssls.enable = true;
          html.enable = true;
          lua_ls.enable = true;
          nixd.enable = true;
          pyright.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
            installRustfmt = true;
          };
          terraformls = {
            enable = true;
            autostart = true;
            filetypes = [ "ts" ];
          };
          ts_ls.enable = true;
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
            "<leader>ca" = {
              action = "code_action";
              desc = "Actions";
            };
          };
        };
      };
    };
  };
}
