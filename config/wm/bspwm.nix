{ config, pkgs, ... }:
{
  xsession.windowManager.bspwm = {
    enable = true;

    # Settings
    settings = {
      border_width = 1;
      window_gap = 10;
      split_ratio = 0.52;
      borderless_monocle = true;
      gapless_monocle = true;
      focus_follows_pointer = true;
    };

    # Startup Programs
    startupPrograms = [
      "picom -f"
      "feh --bg-scale ~/.dotfiles/wallpapers/bleak_cabin.png"
      "nm-applet"
      "emacs --daemon 2> /dev/null"
    ];

    # Defining workspace names
    monitors = {
      HDMI-1 = [
        "1"
        "2"
        "3"
        "4"
        "5"
        "6"
        "7"
        "8"
        "9"
        "10"
      ];
    };
  };

  # sxhkd Config
  services.sxhkd = {
    enable = true;

    # extraConfig = ''
    #   super + {_, shift + {1-9,0}
    #     bspc {desktop --focus, node -d} '^{1-9,10}'
    # '';

    # Defining keybindings
    keybindings = {
      # terminal
      "super + Return" = "kitty";

      # run launcher
      "super + @space" = "rofi -show drun -show-icons";

      # Reset sxhkd
      "super + Escape" = "pkill -USR1 -x sxhkd";

      # launch
      # browser
      "super + b" = "zen";

      # discord client
      "super + d" = "vesktop";

      # bspwm hotkeys

      # quit/restart bspwm
      "super + alt + {q, r}" = "bspc {quit,wm} -r";

      # close and kill
      "super + {_, shift + } w" = "bspc node -{c, k}";

      # alternate between tiled and monocle layouts
      "super + m" = "bspc desktop -l next";

      # send the newest marked node to the newest preselected node
      "super + y" = "bspc node newest.marked.local -n newest.!automatic.local";

      # swap the current node and the biggest window
      "super + g" = "bspc node -s biggest.window";

      # set the window state
      "super + {t, shift + t, s, f}" = "bspc node -t {tiled, pseudo_tiled, floating, fullscreen}";

      # set the node flags
      "super + ctrl + {m, x, y, z}" = "bspc node -g {marked, locked, sticky, private}";

      # focus/swap
      "super + {_, shift + } {h, j, k, l}" = "bspc node -{f,s} {west, south, north, east}";

      # focus the node for the given path jump
      "super + {p, b, comma, period}" = "bspc node -f @{parent, brother, first, second}";

      # focus the next/previous window in the current desktop
      "super + {_, shift + } @tab" = "bspc node -f {next, prev}.local.!hidden.window";

      # focus the next/previous desktop in the current monitor
      "super + bracket{left, right}" = "bspc desktop -f {prev, next}.local";

      # focus the last node/desktop
      "super + {grave, Tab}" = "bspc {node, desktop} -f last";

      # focus or send to the given desktop
      "super + {_,shift + }{1-9,0}" = "bspc {desktop -f, node -d} '^{1-9,10}'";

      # preselect direction
      "super + ctrl + {h, j, k, l}" = "bspc node -p {west, south, north, east}";

      # preselect the ratio
      "super + ctrl + {1-9}" = "bspc node -o 0.{1-9}";

      # cancel the preselection for the focused node
      "super + ctrl + space" = "bspc node -p cancel";

      # cancel the preselection for the focused desktop
      "super + ctrl + shift + space" = "bspc query -N -d | xargs -I id -n 1 bspc node id -p cancel";

      # move/resize

      # expand a window by moving one of its sides outward
      "super + alt + {h, j, k, l}" = "bspc node -z {left -20 0, bottom 0 20, top 0 -20, right 20 0";

      # contract a window by moving one of its sides inwards
      "super + alt + shift + {h, j, k, l}" = "bspc node -z {right -20 0, top 0 20, bottom 0-20, left 20 0}";

      # move a floating window
      "super + {Left, Down, Up, Right}" = "bspc node -v {-20 0, 0 20, 0 -20, 20 0}";

      # volume controls
      "super + minus" = "pactl set-sink-volume 0 -5%";
      "super + equal" = "pactl set-sink-volume 0 +5%";
      "super + plus" = "pactl set-sink-mute 0 toggle";

      # media controls
      "super + period" = "playerctl next";
      "super + comma" = "playerctl previous";
      "super + p" = "playerctl play-pause";
      # "" = "";

      # "" = "";
      # "" = "";
    };
  };
}
