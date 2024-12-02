{
  programs.nixvim.plugins.dap = {
    enable = true;

    configurations = {
      c = [
        {
        name = "Launch";
        type = "gdb";
        request = "launch";
        }
        {
        name = "Select and attach to process";
        type = "gdb";
        request = "attach";
        }
      ];
    };

    extensions = {
      dap-ui.enable = true;
      dap-virtual-text.enable = true;
      dap-python.enable = true;
      dap-go.enable = true;
    };
  };
}
