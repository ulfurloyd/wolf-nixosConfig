{ inputs, pkgs, ... }:

{
  programs.wezterm = {
    enable = true;
    package = inputs.wezterm.packages.${pkgs.system}.default;

    enableZshIntegration = true;

    extraConfig = ''
      return {
        font_size = 13.0;
        color_scheme = 'carbonfox';

        use_fancy_tab_bar = false;
        hide_tab_bar_if_only_one_tab = true;
        tab_bar_at_bottom = true;
      }
    '';
  };
}
