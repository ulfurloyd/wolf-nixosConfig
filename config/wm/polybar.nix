{ config, pkgs, stylix, userSettings, ... }:
let
  stylixPalette = config.stylix.base16Scheme;
  font = config.stylix.fonts.sansSerif.name;
in
{
  services.polybar = {
    enable = true;
    script = "polybar bar &amp;";

    settings = {
      "bar/example" = {
        width = "100%";
        height = "25";
        radius = "7.0";
        font-0 = "${font}:size=10:0";

        line-size = "2";
        line-color = "#${config.stylix.base16Scheme.base01}";

        border-size = "6";

        padding = "0";

        module-margin-left = "0";
        module-margin-right = "0";

        seperator = "||";

        "modules-left" = "bspwm xwindow";
        "modules-center" = "spotify";
        "modules-right" = "filesystem date";

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

      "module/filesystem" = {
        type = "internal/fs";
        interval = "25";

        mount-0 = "/";

        format-mounted = "<label-mounted>";
        format-unmounted = "<label-unmounted>";
      };

      "module/xwindow" = {
        type = "internal/xwindow";
        label = "%title:0:30:...%";
      };

      "module/spotify" = {
        type = "custom/script";
        interval = "1";
        format-prefix = "";
        format-underline = "#${stylixPalette.base03}";
        format = "<label>";
        exec = "~/.dotfiles/scripts/polybarSpotifyWrapper.sh";
        # format-underline = "#dd0000";
        "click-left" = "playerctl --player=spotify play-pause";
        "click-right" = "playerctl --player=spotify next";
        "click-middle" = "playerctl --player=spotify previous";
      };
    };
  };
}
