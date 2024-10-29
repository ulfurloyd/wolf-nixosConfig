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
    ];
  };
}
