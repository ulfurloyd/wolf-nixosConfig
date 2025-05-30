{ config, userSettings, ... }:
let
  stylixPalette = config.stylix.base16Scheme;
in
{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        margin-top = 6;
        margin-left = 5;
        margin-right = 5;
        output = [
          "eDP-1"
        ];

        modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ "custom/spotify" "mpris" ];
        modules-right = [ "tray" "custom/wttr" "pulseaudio" "network" "cpu" "disk" "memory" "battery" "clock" ];

        "custom/launcher" = {
          "format" = " λ";
          "on-click" = "wofi --show drun -l top_left";
          "tooltip" = false;
        };
        
        "custom/wttr" = {
          "format" = "{}  ";
          "interval" = 300;
          "exec" = "/home/${userSettings.username}/.dotfiles/home/common/scripts/wttrin.sh";
        };

        "group/hardware" = {
          orientation = "horizontal";
          drawer = {
            "transition-duration" = 500;
          };
          modules = [
            "cpu"
            "disk"
            "memory"
          ];
        };

        "mpris" = {
          "format" = " {player_icon}  {title} - {artist}";
          "format-paused" = "{status_icon} {title} - {artist}";
          "tooltip-format" = "{title} - {artist}" ;
          "player-icons" = {
            "default" = "▶";
            "mpv" = "🎵";
          };
          "status-icons" = {
            "paused" = "⏸";
          };
          "ignored-players" = [ "legcord" ];
        };

        "pulseaudio" = {
          "scroll-step" = 5;
          "format" = "{icon}  {volume}%";
          "format-bluetooth" = "{volume}% {icon} {format_source}";
          "format-bluetooth-muted" = " {icon} {format_source}";
          "format-muted" = " {format_source}";
          "format-source" = "{volume}% ";
          "format-source-muted" = " ";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [
              ""
              " "
              " "
            ];
          };
          "on-click" = "pavucontrol";
        };

        "disk" = {
          "intervel" = 30;
          "format" = "󰋊 {percentage_used}%";
          "tooltip-format" = "{used} used out of {total} on \"{path}\" ({percentage_used}%)";
        };

        "memory" = {
          "interval" = 10;
          "format" = "  {used}";
          "tooltip-format" = "{used}GiB used of {total}GiB ({percentage}%)";
        };

        "cpu" = {
          "interval" = 10;
          "format" = "  {usage}%";
        };

        "clock" = {
          "interval" = 1;
          "format" = "{:%A, %B %d, %Y %H:%M}";
          "format-alt" = "{:%A, %B %d, %Y}";
          # "format-alt" = "{:%d-%m-%Y}";
          "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "niri/workspaces" = {
          "format" = "{icon}";
          "format-icons" = {
            "active" = "";
            "empty" = "";
            "default" = "";
            "urgent" = "";
            "special" = "󰠱";
          };
        };

        "niri/window" = {
          "icon" = true;
          "icon-size" = 20;
        };

        "hyprland/workspaces" = {
          "show-special" = true;
          # "persistent-workspaces" = {
          #   "*" = [1,2,3,4,5,6,7,8,9,10]
          # };
          "format" = "{icon}";
          "format-icons" = {
            "active" = " ";
            "empty" = "";
            # "default" = "";
            "urgent" = "";
            "special" = "󰠱";
          };
        };

        "hyprland/window" = {
          "format" = "{title}";
          "icon" = false;
          "icon-size" = 20;
        };

        "custom/spotify" = {
          "format" = "  {}";
          "max-length" = 50;
          "exec" = "/home/${userSettings.username}/.dotfiles/home/common/scripts/polybarSpotifyWrapper.sh";
          "on-click" = "playerctl play-pause --player=spotify";
          "on-scroll-up" = "playerctl next --player=spotify";
          "on-scroll-down" = "playerctl previous --player=spotify";
          "exec-if" = "pgrep spotfiy";
        };

        "tray" = {
          "icon-size" = 18;
          "spacing" = 10;
        };

        "network" = {
          "format" = "{ifname}";
          "format-wifi" = "   {signalStrength}%";
          "format-ethernet" = "  {ipaddr}";
          "format-disconnected" = ""; # An empty format will hide the module
          "on-click" = "wpa_gui";
          "tooltip-format" = " {ifname} via {gwaddri}";
          "tooltip-format-wifi" = "   {essid} ({signalStrength}%)";
          "tooltip-format-ethernet" = "  {ifname} ({ipaddr}/{cidr})";
          "tooltip-format-disconnected" = "Disconnected";
          "max-length" = 50;
        };

        "battery" = {
          "states" = {
            "good" = 95;
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{icon}   {capacity}%";
          "format-charging" = "  {capacity}%";
          "format-plugged" = "  {capacity}%";
          "format-alt" = "{icon}  {time}";
          # "format-good" = ""; # An empty format will hide the module
          # "format-full" = "";
          "format-icons" = [
            " "
            " "
            " "
            " "
            " "
          ];
        };
      };
    };

    style = ''
      * {
        font-size: 8pt;
      }

      window#waybar {
        background-image: none;
        background: transparent;
      }

      window#waybar.empty {
        background-color: transparent;
      }

      .modules-left {
        background-color: transparent;
        border-style: solid;
        border-width: 1px;
        border-color: @base03;
        border-radius: 14px;
      }
      .modules-left #workspaces {
        background-color: @base00;
        margin-left: 0;
        padding: 0 6px 0 6px;
        border-radius: 14px 0px 0px 14px;
      }
      .modules-left #window {
        background-color: @base01;
        padding: 0 6px 0 6px;
        border-radius: 0px 14px 14px 0px;
      }

      .modules-right {
        background-color: transparent;
        border-style: solid;
        border-width: 1px;
        border-color: @base03;
        border-radius: 14px;
      }
      .modules-right #clock {
        background-color: @base00;
        padding: 0 6px 0 6px;
        margin-right: 0;
        border-radius: 0px 14px 14px 0px;
      }
      .modules-right #battery {
        padding: 0 6px 0 6px;
        background-color: @base01;
      }
      .modules-right #memory {
        padding: 0 6px 0 6px;
        background-color: @base00;
      }
      .modules-right #disk {
        padding: 0 6px 0 6px;
        background-color: @base01;
      }
      .modules-right #cpu {
        padding: 0 6px 0 6px;
        background-color: @base00;
      }
      .modules-right #network {
        padding: 0 6px 0 6px;
        background-color: @base01;
      }
      .modules-right #pulseaudio {
        padding: 0 6px 0 6px;
        background-color: @base00;
      }
      .modules-right #custom-wttr {
        padding: 0 6px 0 6px;
        background-color: @base01;
      }
      .modules-right #tray {
        margin-left: 0;
        padding: 0 6px 0 10px;
        background-color: @base00;
        border-radius: 14px 0px 0px 14px;
      }

      .modules-center {
        background-color: transparent;
        border-style: solid;
        border-width: 1px;
        border-color: @base06;
        border-radius: 14px;
      }
      .modules-center #mpris {
        padding: 0 6px 0 6px;
        background-color: @base0A;
        border-radius: 14px;
      }

      #window {
        border-radius: 2px;
      }

      #tray {
          margin: 0 2px 0 8px;
          padding: 2px;
      }

    '';
  };
}
