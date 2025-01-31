{ pkgs, config, userSettings, ... }:
{
  programs.niri = {
    enable = true;
    settings = {
      binds = with config.lib.niri.actions; let
        sh = spawn "sh" "-c";
        in {
        "Mod+Return".action = spawn "${userSettings.term}";
        "Mod+W".action = close-window;
        "Mod+F".action = maximize-column;
        "Mod+Shift+F".action = fullscreen-window;
        
        "Mod+Shift+P".action = spawn "wlogout";
        
        "Mod+B".action = spawn "${userSettings.browser}";
        "Mod+D".action = spawn "legcord";
        "Mod+E".action = sh "emacsclient -c";

        "Mod+Space".action = sh "wofi --show drun";
        "Mod+Shift+Space".action = sh "wofi --show run";

        "Mod+F12".action = screenshot;
        "Mod+Shift+F12".action = screenshot-screen;
        
        "Mod+Shift+Slash".action = show-hotkey-overlay;
        
        "Mod+T".action = toggle-window-floating;
        "Mod+Shift+T".action = switch-focus-between-floating-and-tiling;
        
        "Mod+1".action = focus-workspace 1;
        "Mod+2".action = focus-workspace 2;
        "Mod+3".action = focus-workspace 3;
        "Mod+4".action = focus-workspace 4;
        "Mod+5".action = focus-workspace 5;
        "Mod+6".action = focus-workspace 6;
        "Mod+7".action = focus-workspace 7;
        "Mod+8".action = focus-workspace 8;
        "Mod+9".action = focus-workspace 9;
        "Mod+0".action = focus-workspace 10;

        "Mod+Shift+1".action = move-window-to-workspace 1;
        "Mod+Shift+2".action = move-window-to-workspace 2;
        "Mod+Shift+3".action = move-window-to-workspace 3;
        "Mod+Shift+4".action = move-window-to-workspace 4;
        "Mod+Shift+5".action = move-window-to-workspace 5;
        "Mod+Shift+6".action = move-window-to-workspace 6;
        "Mod+Shift+7".action = move-window-to-workspace 7;
        "Mod+Shift+8".action = move-window-to-workspace 8;
        "Mod+Shift+9".action = move-window-to-workspace 9;
        "Mod+Shift+0".action = move-window-to-workspace 10;
        
        "Mod+Shift+H".action = move-column-left;
        "Mod+Shift+L".action = move-column-right;
        
        "Mod+Shift+WheelScrollUp".action = move-column-left;
        "Mod+Shift+WheelScrollDown".action = move-column-right;
        
        "Mod+Shift+J".action = consume-or-expel-window-left;
        "Mod+Shift+K".action = consume-or-expel-window-right;
        
        "Mod+Tab".action = focus-workspace-previous;
        
        "Mod+H".action = focus-column-left;
        "Mod+J".action = focus-window-down;
        "Mod+K".action = focus-window-up;
        "Mod+L".action = focus-column-right;
        
        "Mod+WheelScrollUp".action = focus-column-left;
        "Mod+WheelScrollDown".action = focus-column-right;

        "Mod+Control+WheelScrollUp".action = focus-workspace-up;
        "Mod+Control+WheelScrollDown".action = focus-workspace-down;
        
        "Mod+I".action = focus-workspace-up;
        "Mod+O".action = focus-workspace-down;
        
        "Mod+R".action = switch-preset-column-width;

        "Mod+Equal".action = sh "pactl set-sink-volume 0 +5%";
        "Mod+Minus".action = sh "pactl set-sink-volume 0 -5%";
        "Mod+M".action = sh "pactl set-sink-mute 0 toggle";
        
        "Mod+Period".action = sh "playerctl next";
        "Mod+Comma".action = sh "playerctl previous";
        "Mod+P".action = sh "playerctl play-pause";
      };
      
      workspaces = {
        "01-term" = {
          name = "term";
        };
        "02-www" = {
          name = "www";
        };
        "03-disc" = {
          name = "disc";
        };
      };

      input = {
        focus-follows-mouse = {
          enable = true;
        };
      };
      
      layout = {
        focus-ring.enable = false;

        border = {
          enable = true;
          width = 2;
        };

        gaps = 6.0;
        
        preset-column-widths = [
          { proportion = 1. / 3.; }
          { proportion = 1. / 2.; }
          { proportion = 2. / 3.; }
        ];
      };
      
      window-rules = [
        {
          matches = [{ app-id = "[E|e]macs"; }];
          draw-border-with-background = false;
        }

        {
          matches = [{ app-id = "[L|l]egcord"; }];
          open-on-workspace = "disc";
        }
        
        {
          matches = [{ app-id = "[Z|z]en"; }];
          open-on-workspace = "www";
        }
      ];

      environment = {
        LIBGA_DRIVER_NAME = "nvidia";
        __GLX_VENDOR_LIBRARY_NAME = "nvidia";
        DISPLAY = ":0";
      };
      
      spawn-at-startup = [
        { command = [ "~/.nix-profile/bin/xwayland-satellite" ]; }
        { command = [ "mako" ]; }
        { command = [ "emacs" "--daemon" ]; }
        { command = [ "waybar" "&" ]; }
        { command = [ "steam" ]; }
        { command = [ "swww-daemon" ]; }
        { command = [ "swww img /home/${userSettings.username}/.dotfiles/themes/${userSettings.desktopTheme}/wallpaper.png -t random --transition-duration 2" ]; }
      ];
      
      prefer-no-csd = true;

      screenshot-path = "~/Pictures/Screenshots/%FT%%H:%M:%S.png";
      
      hotkey-overlay.skip-at-startup = true;
    };
  };
  
  home.packages = with pkgs; [
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    gnome-keyring
  ];
}
