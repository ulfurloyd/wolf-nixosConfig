{
  programs.nixvim = {
    colorschemes = {
      catppuccin = {
        enable = false;
        settings = {
          # null or one of "latte", "mocha", "frappe", "macchiato", "auto"
          flavour = "mocha";
        };
      };
      kanagawa = {
        enable = false;
        settings = {
          # should be one of "wave", "dragon", or "lotus" but the flavour option doesn't seem to work
          flavour = "lotus";
        };
      };
      nightfox = {
        enable = false;
        # one of "carbonfox", "dawnfox", "dayfox", "duskfox", "nightfox", "nordfox", "terafox"
        flavor = "carbonfox";
      };
    };
  };
}
