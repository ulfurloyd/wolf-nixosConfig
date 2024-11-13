{
  programs.nixvim = {
    plugins = {
      cmp-emoji= {enable = true;};

      cmp = {
        enable = true;

        settings = {
          autoEnableSources = true;
          performance = {
            debounce = 60;
            fetchingTimeout = 200;
            maxViewEntries = 30;
          };
          snippet = {
            expand = "luasnip";
          };
          formatting = {
            fields = [
              "kind"
              "abbr"
              "menu"
            ];
          };
          source = [
          { name = "nvim_lsp"; }
          { name = "emoji"; }
          {
            name = "buffer";
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            keywordLength = 3;
          }
          { 
            name = "path";
            keywordLength = 3;
          }
          {
            name = "luasnip";
            keywordLength = 3;
          }
          { name = "rg"; }
          { name = "nvim_lua"; }
          { name = "git"; }
          ];

          window = {
            completion = {
              border = "solid";
            };
            documentation = {
              border = "solid";
            };
          };

          mapping = {
            "<C-b>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-e>" = "cmp.mapping.abort";
            "<CR>"  = "cmp.mapping.confirm({ select = true })";
          };
        };
      };
      cmp-nvim-lsp = {
        enable = true;
      };
      cmp-nvim-lua = {
        enable = true;
      };
      cmp-rg = {
        enable = true;
      };
      cmp-buffer = {
        enable = true;
      };
      cmp-path = {
        enable = true;
      };
      cmp_luasnip = {
        enable = true;
      };
      cmp-cmdline = {
        enable = true;
      };
      cmp-git = {
        enable = true;
        settings = {
          gitlab = {
            hosts = [ "gitlab.dnm.radiofrance.fr" ];
          };
        };
      };
    };
  };
}
