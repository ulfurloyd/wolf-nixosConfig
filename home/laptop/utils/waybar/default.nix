{ userSettings, ... }:
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
        modules-center = [ "custom/spotify" ];
        modules-right = [ "tray" "pulseaudio" "network" "group/hardware" "battery" "clock" ];

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
          "format" = "{:%H:%M}";
          "format-alt" = "{:%A, %B %d, %Y}";
          # "format-alt" = "{:%d-%m-%Y}";
          "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
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
            "default" = "";
            "urgent" = "";
            "special" = "󰠱";
          };
        };

        "custom/spotify" = {
          "format" = "  {}";
          "max-length" = 50;
          "exec" = "/home/${userSettings.username}/.dotfiles/home/common/scripts/polybarSpotifyWrapper.sh";
          "on-click" = "playerctl play-pause";
          "on-scroll-up" = "playerctl next";
          "on-scroll-down" = "playerctl previous";
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

        "battery" = {
          "states" = {
            "good" = 95;
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{icon}   {capacity}%";
          "format-charging" = "  {capacity}%";
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
      window#waybar {
        background-color: rgba(0,0,0,0.8);
        background: transparent;
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
