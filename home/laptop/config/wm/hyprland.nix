{ config, pkgs, userSettings, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    extraConfig = ''
      # disable this random monitor that i have no clue about
      monitor = Unknown-1, disable

      general {
        gaps_in = 6
        gaps_out = 8
        border_size = 2
        layout = dwindle
      }

      input {
        # swap capslock and escape
        kb_options = caps:swapescape
        numlock_by_default = true;
        touchpad {
          natural_scroll = true
          scroll_factor = 2.0
        }
      }

      cursor {
        no_hardware_cursors = true
      }

      bindm = $mod, mouse:272, movewindow
      bindm = $mod, mouse:273, resizewindow

      exec-once = dunst
      exec-once = waybar &
      exec-once = swww-daemon
      exec = swww img ../../../../themes/${userSettings.laptopTheme}/wallpaper.png -t random --transition-duration 2
    '';

    xwayland.enable = true;

    settings = {
      "monitor" = "eDP-1,1920x1080@144,auto,1.2";
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

        # Brightness Buttons
        ", XF86MonBrightnessUp, exec, brightnessctl -q s +5%"
        ", XF86MonBrightnessDown, exec, brightnessctl -q s 5%-"

        # Volume Buttons
        ", XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
        ", XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

        # Media Controls
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPause, exec, playerctl pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"

        # Power Menu
        "$mod SHIFT, P, exec, wofi-power-menu"

        # Discord
        "$mod, d, exec, legcord"

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
        "workspace 3, legcord"
        "workspace 6, whatsapp-for-linux"
        "workspace 10, spotify"
      ];
    };
  };
}
