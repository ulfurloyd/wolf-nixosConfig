{ config, userSettings, ... }:
{
  programs.niri = {
    enable = true;
    settings = {
      binds = with config.lib.niri.actions; {
        "Mod+Return".action = spawn "${userSettings.term}";
        "Mod+W".action = close-window;
        "Mod+F".action = fullscreen-window;
        
        "Mod+Shift+P".action = spawn "wlogout";
        
        "Mod+B".action = spawn "${userSettings.browser}";
        "Mod+D".action = spawn "legcord";

        "Mod+Space".action = spawn "wofi"  "--show" "drun";
        "Mod+Shift+Space".action = spawn "wofi"  "--show" "run";
        
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
        
        "Mod+Tab".action = focus-workspace-previous;
        
        "Mod+H".action = focus-column-left;
        "Mod+J".action = focus-window-down;
        "Mod+K".action = focus-window-up;
        "Mod+L".action = focus-column-right;
      };
      
      layout = {
        focus-ring.enable = false;
        border.width = 20;
        gaps = 6.0;
      };

      environment = {
        LIBGA_DRIVER_NAME = "nvidia";
        __GLX_VENDOR_LIBRARY_NAME = "nvidia";
        DISPLAY = ":0";
      };
      
      spawn-at-startup = [
        { command = [ "~/.nix-profile/bin/xwayland-satellite" ]; }
        { command = [ "emacs --daemon" ]; }
        { command = [ "waybar" ]; }
        { command = [ "swww-daemon" ]; }
        { command = [ "swww img /home/${userSettings.username}/.dotfiles/themes/${userSettings.desktopTheme}/wallpaper.png -t random --transition-duration 2" ]; }
      ];
    };
  };
}
