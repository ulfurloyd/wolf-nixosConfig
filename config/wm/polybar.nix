{ config, pkgs, ... }:
{
  services.polybar = {
    enable = true;
    script = "polybar bar &amp;";

    settings = {
      "bar/example" = {
        width = "100%";
        height = "18";
        radius = "7.0";
        "modules-center" = "bspwm";
        "modules-left" = "date";
        wm-restack = "bspwm";
      };

      "module/bspwm" = {
        type = "internal/bspwm";
        label-focused = "%name%";
      };

      "module/date" = {
        type = "internal/date";
        
        # Seconds to sleep between updates
        # Default: 1.0
        interval = "1.0";
        
        # See "https://en.cppreference.com/w/cpp/io/manip/put_time" for details on how to format the date string
        # NOTE: if you want to use syntax tags here you need to use %%{...}
        date = "%Y-%m-%d%";
        
        # Optional time format
        time = "%H:%M";
        
        # if `date-alt` or `time-alt` is defined, clicking
        # the module will toggle between formats
        date-alt = "%A, %d %B %Y";
        time-alt = "%H:%M:%S";
      };
    };
  };
}
