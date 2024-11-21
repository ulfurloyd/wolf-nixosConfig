{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;

      extensions = {
        file-browser = {
          enable = true;
        };
        ui-select = {
          enable = true;
        };
        frecency = {
          enable = false;
        };
        fzf-native = {
          enable = true;
        };
      };

      settings = {
        defaults = {
          layout_config = {
            horizontal = {
              prompt_position = "top";
            };
          };
          sorting_strategy = "ascending";
        };
        pickers = {
          colorscheme = {
            enable_preview = true;
          };
        };
      };
      keymaps = {
        "<C-p>" = {
          action = "find_files";
          options = {
            desc = "Find project files";
          };
        };
        "<leader>fg" = {
          action = "live_grep";
          options = {
            desc = "Live Grep";
          };
        };
        "<C-o>" = {
          action = "buffers";
          options = {
            desc = "Buffers";
          };
        };
      };
    };
  };
}
