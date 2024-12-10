{
  programs.nixvim = {
    plugins = {
      cmp-emoji.enable = true;
      luasnip.enable = true;

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
            expand = "function(args) require('luasnip').lsp_expand(args.body) end";
          };

          formatting = {
            fields = [
              "kind"
              "abbr"
              "menu"
            ];
          };
          sources = [
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
            "<C-n>" = "cmp.mapping.select_next_item()";
            "<C-p>" = "cmp.mapping.select_prev_item()";
            "<sc-p>" = "cmp.mapping.scroll_docs(-4)";
            "<sc-n>" = "cmp.mapping.scroll_docs(4)";
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
