{
  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;

    fade = true;
    fadeDelta = 3;

    extraArgs = [ "-f" ];

    inactiveOpacity = 0.8;

    settings = {
      blur = {
        method = "dual_kawase";
        size = 10;
        deviation = 5.0;
      };

      blur-background-exclude = [
        "class_g = 'Polybar'"
      ];

      corner-radius = 5;
    };

    wintypes = {
      dock = { blur = false; };
      toolbar = { blur = false; };
      dialog = { blur = false; };
      notification = { blur = false; };
      popup_menu = { blur = false; };
      dropdown_menu = { blur = false; };
    };
  };
}
