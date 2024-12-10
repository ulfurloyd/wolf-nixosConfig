{
  programs.nixvim = {
    globals.mapleader = " ";

    keymaps = [
      {
        mode = "n";
        key = "-";
        action = ":Oil<CR>";
        options = {
          desc = "Open parent directory";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>pg";
        action = ":Telescope live_grep<CR>";
        options = {
          desc = "Telescope Live Grep";
        };
      }
      {
        mode = "n";
        key = "<leader>tp";
        action = ":TransparentToggle<CR>";
        options = {
          desc = "Toggle Transparency";
        };
      }
      {
        mode = "n";
        key = "<leader>op";
        action = ":Neotree toggle<CR>";
        options = {
          desc = "Toggle Neotree";
        };
      }
      {
        mode = "n";
        key = "<leader>gg";
        action = ":LazyGit<CR>";
        options = {
          desc = "LazyGit";
        };
      }
      {
        mode = "n";
        key = "<leader>mp";
        action = ":MarkdownPreviewToggle<CR>";
        options = {
          desc = "Markdown Preview Toggle";
        };
      }
      {
        mode = "n";
        key = "<leader>db";
        action = ":lua require('dap').toggle_breakpoint()<CR>";
        options = {
          desc = "Toggle Debugger Breakpoint";
        };
      }
      {
        mode = "n";
        key = "<leader>dc";
        action = ":lua require('dap').toggle_breakpoint()<CR>";
        options = {
          desc = "Continue Debugger";
        };
      }
      {
        mode = "n";
        key = "<leader>du";
        action = ":lua require('dapui').toggle()<CR>";
        options = {
          desc = "Toggle Dap-UI";
        };
      }
    ];
  };
}
