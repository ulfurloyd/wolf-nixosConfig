{
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            # capslock = "overload(meta, esc)";
            capslock = "esc";
            esc = "capslock";
          };
        };
      };
    };
  };
}
