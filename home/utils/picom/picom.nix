{
  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;

    fade = true;
    fadeDelta = 3;

    extraArgs = [ "-f" ];

    settings = {
      blur = {
        method = "dual_kawase";
        size = 10;
        deviation = 5.0;
      };

      blur-background-exclude = [
        "class_g = 'Polybar'"
      ];
    };

    wintypes = {
      dock = { blur = false; };
      toolbar = { blur = false; };
      dialog = { blur = false; };
    };
  };
}
