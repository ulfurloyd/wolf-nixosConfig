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
        height = 28;
        margin-top = 6;
        margin-left = 5;
        margin-right = 5;
        output = [
          "DP-3"
          "HDMI-A-1"
        ];
        name = "mainBar";

        modules-left = [ "niri/workspaces" "hyprland/workspaces" "niri/window" "hyprland/window" ];
        modules-center = [ "custom/spotify" "mpris" ];
        modules-right = [ "tray" "custom/wttr" "pulseaudio" "cpu" "disk" "memory" "clock" ];

        "custom/launcher" = {
          "format" = " ξ";
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
          "format" = "  {player_icon}  {title} - {artist}  ";
          "format-paused" = "  {status_icon} {title} - {artist}  ";
          "tooltip-format" = "{title} - {artist}" ;
          "player-icons" = {
            "default" = "▶";
            "mpv" = "🎵";
          };
          "status-icons" = {
            "paused" = "⏸";
          };
          "ignored-players" = [ "firefox" "zen" "whatsapp-for-linux" "legcord" ];
        };
          
        "cava"= {
          # "cava_config"= "~/.config/cava/config";
          "framerate"= 30;
          "autosens"= 1;
          "sensitivity"= 100;
          "bars"= 14;
          "lower_cutoff_freq"= 50;
          "higher_cutoff_freq"= 10000;
          "method"= "pulse";
          "source"= "auto";
          "stereo"= true;
          "reverse"= false;
          "bar_delimiter"= 0;
          "monstercat"= false;
          "waves"= false;
          "noise_reduction"= 0.77;
          "input_delay"= 4;
          "format-icons" = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
          "actions"= {
            "on-click-right"= "mode";
           };
        };

        "pulseaudio" = {
          "scroll-step" = 5;
          "format" = "{icon}  {volume}%";
          "format-bluetooth" = "{volume}% {icon} {format_source}";
          "format-bluetooth-muted" = " {icon} {format_source}";
          "format-muted" = " {format_source}";
          "format-source" = "{volume}%  ";
          "format-source-muted" = "  ";
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
          "format" = "󰋊 {percentage_used}%  ";
          "tooltip-format" = "{used} used out of {total} on \"{path}\" ({percentage_used}%)";
        };

        "memory" = {
          "interval" = 10;
          "format" = "  {used}  ";
          "tooltip-format" = "{used}GiB used of {total}GiB ({percentage}%)";
        };

        "cpu" = {
          "interval" = 10;
          "format" = "  {usage}%  ";
        };

        "clock" = {
          "interval" = 1;
          "format" = "{:%A, %B %d, %Y %H:%M} ";
          "format-alt" = "{:%A, %B %d, %Y} ";
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
            "active" = "";
            "empty" = "";
            # "default" = "";
            "urgent" = "";
            "special" = "󰠱";
          };
        };

        "hyprland/window" = {
          "format" = "  {title}  ";
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
          "tooltip-format" = " {ifname} via {gwaddri}";
          "tooltip-format-wifi" = "   {essid} ({signalStrength}%)";
          "tooltip-format-ethernet" = "  {ifname} ({ipaddr}/{cidr})";
          "tooltip-format-disconnected" = "Disconnected";
          "max-length" = 50;
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
        border-style: none;
      }
      .modules-left #workspaces {
        background-color: @base00;
        margin-left: 0;
        padding-left: 0;
        border-radius: 14px 0px 0px 14px;
      }
      .modules-left #window {
        background-color: @base01;
        border-radius: 0px 14px 14px 0px;
      }

      .modules-right {
        background-color: transparent;
        border-style: none;
      }
      .modules-right > *:not(:first-child) {
        margin-right: 6px;
        margin-left: 6px;
      }
      .modules-right #clock {
        background-color: @base00;
        margin-right: 0;
        padding-right: 0;
        border-radius: 0px 14px 14px 0px;
      }
      .modules-right #memory {
        background-color: @base01;
      }
      .modules-right #disk {
        background-color: @base00;
      }
      .modules-right #cpu {
        background-color: @base01;
      }
      .modules-right #pulseaudio {
        background-color: @base00;
      }
      .modules-right #custom-wttr {
        background-color: @base01;
      }
      .modules-right #tray {
        background-color: @base00;
        border-radius: 14px 0px 0px 14px;
      }

      .modules-center {
        background-color: transparent;
        border-style: none;
      }
      .modules-center #mpris {
        background-color: @base00;
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
