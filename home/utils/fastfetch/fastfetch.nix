{ userSettings, ... }:
let
  eva = {
    path = "/home/${userSettings.username}/.dotfiles/home/utils/fastfetch/images/eva01.png";
    width = 30;
    height = 20;
  };

  widowmaker = {
    path = "/home/${userSettings.username}/.dotfiles/home/utils/fastfetch/images/widowmaker.png";
    width = 32;
    height = 20;
  };

  chosen = eva;
in
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "kitty-direct";
        source = "${chosen.path}";

        padding = {
          right = 2;
        };

        width = chosen.width;
        height = chosen.height;
      };

      display = {
        size = { binaryPrefix = "si"; };
        separator = "   ";
      };

      modules = [
        {
        type = "title";
        key = "  User";
        }
        {
          type = "custom";
          format = "╭───────────────────────────────SYSTEM────────────────────────────────╮";
        }
        {
          type = "os";
          key = "╭── Operating System";
        }
        {
          type = "kernel";
          key = "├── Kernel";
        }
        {
          type = "packages";
          key = "├── Packages";
        }
        {
          type = "shell";
          key = "├── Shell";
        }
        {
          type = "wm";
          key = "├── Window Manager";
        }
        {
          type = "terminal";
          key = "╰── Terminal";
        }
        "break"

        {
          type = "custom";
          format = "╭──────────────────THEMES───────────────────╮";
        }
        {
          type = "theme";
          key = "╭── Theme";
        }
        {
          type = "icons";
          key = "├── Icons";
        }
        {
          type = "terminalfont";
          key = "├── Font";
        }
        {
          type = "cursor";
          key = "╰── Cursor";
        }
        "break"

        {
          type = "custom";
          format = "╭────────────────────RESOURCES─────────────────────╮";
        }
        {
          type = "cpu";
          key = "╭── CPU";
        }
        {
          type = "gpu";
          key = "├── GPU";
        }
        {
          type = "memory";
          key = "├── Memory";
        }
        {
          type = "swap";
          key = "├── Swap";
        }
        {
          type = "disk";
          key = "╰── Disk";
        }
      ];
    };
  };
}
