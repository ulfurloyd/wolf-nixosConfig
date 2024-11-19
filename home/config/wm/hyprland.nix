{ config, pkgs, userSettings, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    extraConfig = ''
      # disable this random monitor that i have no clue about
      monitor = Unknown-1, disable

      input {
        # swap capslock and escape
        kb_options = caps:swapescape
      }

      env = LIBGA_DRIVER_NAME,nvidia
      env = __GLX_VENDOR_LIBRARY_NAME,nvidia
      cursor {
        no_hardware_cursors = true
      }

      bindm = $mod, mouse:272, movewindow
      bindm = $mod, mouse:273, resizewindow

      exec-once = dunst
      exec-once = waybar &
      exec-once = swww-daemon
      exec = swww img /home/${userSettings.username}/.dotfiles/themes/${userSettings.theme}/wallpaper.png -t random --transition-duration 2
    '';

    xwayland.enable = true;

    settings = {
      "monitor" = "HDMI-A-1,1920x1080@144,auto,1";
      "$mod" = "SUPER";

      bind = [
        "$mod, RETURN, exec, ${userSettings.term}"
        "$mod, w, killactive"
        "$mod, f, fullscreen"

        "$mod, b, exec, ${userSettings.browser}"

        "$mod, t, togglefloating"
        "$mod SHIFT, j, togglesplit"
        "$mod, SPACE, exec, wofi --show drun"
        "SUPER_SHIFT, SPACE, exec, wofi --show run"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
        "$mod, tab, workspace, previous"

        "$mod SHIFT, h, movewindow, l"
        "$mod SHIFT, j, movewindow, d"
        "$mod SHIFT, k, movewindow, u"
        "$mod SHIFT, l, movewindow, r"

        "$mod, h, movefocus, l"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"
        "$mod, l, movefocus, r"

        "$mod ALT, h, resizeactive, -100 0"
        "$mod ALT, j, resizeactive, 0 100"
        "$mod ALT, k, resizeactive, 0 -100"
        "$mod ALT, l, resizeactive, 100 0"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        # Power Menu
        "$mod SHIFT, P, exec, wofi-power-menu"

        # Volume Controls
        "$mod, equal, exec, pactl set-sink-volume 0 +5%"
        "$mod, minus, exec, pactl set-sink-volume 0 -5%"
        "$mod, plus, exec, pactl set-sink-mute 0 toggle"
        
        # Media Controls
        "$mod, period, exec, playerctl next"
        "$mod, comma, exec, playerctl previous"
        "$mod, p, exec, playerctl play-pause"

        # Discord
        "$mod, d, exec, vesktop"

        # Grimblast Screenshots
        "$mod SHIFT, f12, exec, grimblast --notify copysave screen"
        "$mod, f12, exec, grimblast --notify copysave area"

        # Scratchpad
        "$mod, s, exec, scratchpad"
        "$mod SHIFT, s, exec, scratchpad -g -m 'wofi -d'"
      ];

      windowrule = [
        "workspace 2, ${userSettings.browser}"
        "workspace 3, vesktop"
        "workspace 6, whatsapp-for-linux"
      ];
    };
  };

  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading_bar = true;
        grace = 300;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          monitor = "";
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      input-field = [
        {
           size = "200, 50";
           position = "0, -20";
           monitor = "";
           dots_center = true;
           fade_on_empty = false;
           font_color = "rgb(202, 211, 245)";
           inner_color = "rgb(91, 96, 120)";
           outer_color = "rgb(24, 25, 38)";
           outline_thickness = 5;
           shadow_passes = 2;
        }
      ];

      label = [
        {
          text = "$USER";
          font_size = 20;
          position = "-100, 160";
          halign = "right";
          valign = "bottom";
          shadow_passes = 5;
          shadow_size = 10;
        }
      ];
    };
  };
}
