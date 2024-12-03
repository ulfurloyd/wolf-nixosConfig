{
  programs.nixvim.plugins = {
    which-key = {
      enable = true;

      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>b";
            group = "Buffers";
            icon = "󰓩 ";
          }
          {
            __unkeyed-1 = "<leader>f";
            group = "File Options";
          }
        ];
      };
    };
  };
}
