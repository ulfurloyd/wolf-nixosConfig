{ inputs, userSettings, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

    xwayland.enable = true;

    settings = {
      "monitor" = [
        "DP-3,1920x1080@144,0x0,1"
        "HDMI-A-1,preferred,1920x0,auto"
      ];
      "$mod" = "SUPER";

      general = {
        gaps_in = 6;
        gaps_out = 8;
        border_size = 2;
        layout = "dwindle";
      };

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

        "$mod, bracketleft, focusmonitor, -1"
        "$mod, bracketright, focusmonitor, +1"

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

        # Power Menu and Hyprlock
        "$mod SHIFT, P, exec, wlogout"

        # Volume Controls
        "$mod, equal, exec, pactl set-sink-volume 0 +5%"
        "$mod, minus, exec, pactl set-sink-volume 0 -5%"
        "$mod, m, exec, pactl set-sink-mute 0 toggle"
        
        # Media Controls
        "$mod, period, exec, playerctl next"
        "$mod, comma, exec, playerctl previous"
        "$mod, p, exec, playerctl play-pause"

        # Emacs Client window
        "$mod, e, exec, emacsclient -c"

        # Discord
        "$mod, d, exec, legcord"

        # Grimblast Screenshots
        "$mod SHIFT, f12, exec, grimblast --notify copysave screen"
        "$mod, f12, exec, grimblast --notify copysave area"

        # Scratchpad
        "$mod, s, exec, scratchpad"
        "$mod SHIFT, s, exec, scratchpad -g -m 'wofi -d'"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      workspace = [
        "1,monitor:DP-3"
        "2,monitor:DP-3"
        "3,monitor:HDMI-A-1"
        "4,monitor:DP-3"
        "5,monitor:HDMI-A-1"
        "6,monitor:DP-3"
        "7,monitor:DP-3"
        "8,monitor:DP-3"
        "9,monitor:HDMI-A-1"
        "10,monitor:HDMI-A-1"
      ];

      decoration = {
        rounding = 5;
      };

      windowrule = [
        "workspace 2,class:^(zen)$"
        "workspace 3,class:^(vesktop)$"
        "workspace 3,class:^(legcord)$"
        "workspace 6,class:^(whatsapp-for-linux)$"
        "workspace 10,class:^(spotify)$"
      ];

      cursor = {
        no_hardware_cursors = true;
      };

      exec-once = [
        "emacs --daemon"
        "swww-daemon"
        "swww img /home/${userSettings.username}/.dotfiles/themes/${userSettings.nyxTheme}/wallpaper.png -t random --transition-duration 2"
        "swww img /home/${userSettings.username}/.dotfiles/themes/${userSettings.nyxTheme}/wallpaper.png -t random --transition-duration 2"
      ];
    };

    plugins = [
      # inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
      # inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprexpo
    ];

    extraConfig = ''
      # disable this random monitor that i have no clue about
      monitor = Unknown-1, disable

      env = LIBGA_DRIVER_NAME,nvidia
      env = __GLX_VENDOR_LIBRARY_NAME,nvidia
    '';
  };

  home.packages = with pkgs; [
    xdg-desktop-portal-hyprland
    # hyprpanel
  ];
}
