{ config, pkgs, userSettings, ... }:
{
  services.polybar = {
    enable = true;
    script = "polybar bar &amp;";

    settings = {
      "bar/example" = {
        width = "100%";
        height = "24";
        radius = "7.0";
        font-0 = "FiraCode Serif:size=10:0";
        "modules-left" = "bspwm";
        "modules-center" = "spotify";
        "modules-right" = "date";
        wm-restack = "bspwm";
      };

      "module/bspwm" = {
        type = "internal/bspwm";

        label-focused = "%name%";
        label-focused-padding = "2";
        label-focused-font = "0";

        label-occupied = "%name%";
        label-occupied-padding = "2";
        label-occupied-font = "0";

        label-urgent = "%name%!";
        label-urgent-padding = "2";
        label-urgent-font = "0";

        label-empty = "%name%";
        label-empty-padding = "2";
        label-empty-font = "0";
      };

      "module/date" = {
        type = "internal/date";
        
        # Seconds to sleep between updates
        # Default: 1.0
        interval = "1.0";
        
        # See "https://en.cppreference.com/w/cpp/io/manip/put_time" for details on how to format the date string
        # NOTE: if you want to use syntax tags here you need to use %%{...}
        date = "%d/%m/%Y";
        date-alt = "%Y-%m-%d";
        
        # Optional time format
        time = "%H:%M";
        time-alt = "%H:%M:%S";
        
        # if `date-alt` or `time-alt` is defined, clicking
        # the module will toggle between formats

        label = "%time% %date%";
      };

      "module/spotify" = {
        type = "custom/script";
        interval = "1";
        format-prefix = "";
        format = "<label>";
        exec = "~/.dotfiles/scripts/polybarSpotifyWrapper.sh";
        format-underline = "#dd0000";
        "click-left" = "playerctl --player=spotify play-pause";
        "click-right" = "playerctl --player=spotify next";
        "click-middle" = "playerctl --player=spotify previous";
      };
    };
  };
}
