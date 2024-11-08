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
        wm-restack = "bspwm";
      };

      "module/bspwm" = {
        type = "internal/bspwm";
        label-focused = "%name%";
      };
    };
  };
}
