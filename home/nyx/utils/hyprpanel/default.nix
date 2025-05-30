{ userSettings, inputs, ... }:
{
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

  programs.hyprpanel = {
    enable = true;
    overwrite.enable = false;
    hyprland.enable = false;

    settings = {
      bar = {
        launcher.autoDetectIcon = true;
        workspaces.show_icons = true;

        customModules = {
          weather = {
            unit = "metric";
          };
        };
      };

      layout = {
        "bar.layouts" = {
          "*" = {
            left = [ "dashboard" "cava" "workspaces" "windowtitle" ];
            middle = [ "media" ];
            right = [ "systray" "volume" "clock" "notifications" ];
          };
        };
      };

      menus = {
        clock = {
          time = {
            military = true;
            hideSeconds = true;
          };

          weather.unit = "metric";
        };

        dashboard.directories.enabled = false;
      };

      theme = {
        bar.transparent = true;
        font.size = "14px";
        matugen = true;
        name = "monochrome";
      };

      wallpaper = {
        enable = true;
        image = "/home/wolf/.dotfiles/themes/${userSettings.nyxTheme}/wallpaper.png";
        pywal = true;
      };
    };
  };
}
