{ userSettings, config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    settings = {
      font = userSettings.font;
      font_family = "FiraCode-Regular";
      font_size = "13.0";
      enable_audio_bell = "no";
      confirm_os_window_close = "0";
      shell = userSettings.shell;
      dynamic_background_opacity = "yes";
      tab_bar_style = "powerline";
    };

    keybindings = {
      ## LAYOUTS
      # layout selection
      # "alt+f"           = "goto_layout stack";
      # "alt+v"           = "goto_layout tall";
      # "alt+s"           = "goto_layout fat";

      #-----------------------------------------------------#

      ## TABS
      # tab selection
      # "alt+1"                 = "goto_tab 1";
      # "alt+2"                 = "goto_tab 2";
      # "alt+3"                 = "goto_tab 3";
      # "alt+4"                 = "goto_tab 4";
      # "alt+5"                 = "goto_tab 5";
      # "alt+6"                 = "goto_tab 6";
      # "alt+7"                 = "goto_tab 7";
      # "alt+8"                 = "goto_tab 8";
      # "alt+9"                 = "goto_tab 9";
      # "alt+10"                = "goto_tab 10";

      # tab management
      # "alt+t"                 = "new_tab";
      # "alt+shift+w"           = "close_tab";
      # "alt+shift+r"           = "set_tab_title";

      # return to last accessed tab
      # "alt+tab"               = "goto_tab -1";

      #-----------------------------------------------------#


      ## WINDOWS
      # new window
      # "alt+enter"             = "new_window";

      # window navigation
      # "alt+h"                 = "neighboring_window left";
      # "alt+j"                 = "neighboring_window bottom";
      # "alt+k"                 = "neighboring_window top";
      # "alt+l"                 = "neighboring_window right";

      # window movement
      # "alt+shift+h"           = "move_window left";
      # "alt+shift+j"           = "move_window bottom";
      # "alt+shift+k"           = "move_window top";
      # "alt+shift+l"           = "move_window right";

      # window management
      # "alt+r"                 = "set_window_title";
      # "alt+w"                 = "close_window";

      # window resizing
      # "ctrl+alt+="            = "resize_window wider";
      # "ctrl+alt+-"            = "resize_window narrower";
      # "ctrl+alt+["            = "resize_window shorter";
      # "ctrl+alt+]"            = "resize_window taller";

      ## opacity
      # "alt+y>="          = "set_background_opacity +0.2";
      # "alt+y>-"          = "set_background_opacity -0.2";

      #-----------------------------------------------------#
      
      "ctrl+shift+n"     = "no_op";
      "ctrl+shift+p"     = "no_op";

    };

    extraConfig = ''
      # Nightfox colors for Kitty
      ## name: nightfox
      ## upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/nightfox/kitty.conf
      
      foreground                      #f2f4f8
      background                      #161616
      selection_foreground            #f2f4f8
      selection_background            #2a2a2a
      
      #: Cursor colors
      cursor                          #f2f4f8
      cursor_text_color               #161616
      
      #: URL underline color when hovering with mouse
      url_color                       #25be6a
      
      #: kitty window border colors and terminal bell colors
      active_border_color             #78a9ff
      inactive_border_color           #535353
      bell_border_color               #3ddbd9
      # visual_bell_color               none
      
      #: OS Window titlebar colors
      # wayland_titlebar_color          system
      # macos_titlebar_color            system
      
      #: Tab bar colors
      active_tab_foreground           #0c0c0c
      active_tab_background           #78a9ff
      inactive_tab_foreground         #6e6f70
      inactive_tab_background         #2a2a2a
      # tab_bar_background              none
      # tab_bar_margin_color            none
      
      #: Colors for marks (marked text in the terminal)
      # mark1_foreground black
      # mark1_background #98d3cb
      # mark2_foreground black
      # mark2_background #f2dcd3
      # mark3_foreground black
      # mark3_background #f274bc
      
      #: The basic 16 colors
      #: black
      color0 #282828
      color8 #484848
      
      #: red
      color1 #ee5396
      color9 #f16da6
      
      #: green
      color2  #25be6a
      color10 #46c880
      
      #: yellow
      color3  #ebcb8b
      color11 #f0d399
      
      #: blue
      color4  #78a9ff
      color12 #8cb6ff
      
      #: magenta
      color5  #be95ff
      color13 #c8a5ff
      
      #: cyan
      color6  #33b1ff
      color14 #52bdff
      
      #: white
      color7  #dfdfe0
      color15 #e4e4e5
      
      #: You can set the remaining 240 colors as color16 to color255.
      color16 #3ddbd9
      color17 #ff7eb6
    '';
  };
}
