{ config, pkgs, inputs, userSettings, ... }:
let
  cfg = config.services.seatd;
in
{

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Shells
  environment.shells = with pkgs; [ bash zsh ];

  environment.sessionVariables = {
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
    XDG_SCREENSHOTS_DIR = "$HOME/Pictures/Screenshots";
  };

  # Enable networking
  networking.networkmanager.enable = true;

  # Systemd services
  systemd.services = {
    seatd = {
      enable = true;

      unitConfig = {
        Description = "Seatd";
        Documentation = [ "man:seatd(1)" ];
      };

      wantedBy = [ "multi-user.target" ];
      restartIfChanged = false;

      serviceConfig = {
        Type = "simple";
        NotifyAccess = "all";
        SyslogIdentifier = "seatd";
        ExecStart = "${pkgs.sdnotify-wrapper}/bin/sdnotify-wrapper ${pkgs.seatd.bin}/bin/seatd -n 1 -u ${cfg.user} -g ${cfg.group} -l ${cfg.logLevel}";
        RestartSec = 1;
        Restart = "always";
      };
    };
  };

  # Set your time zone and hardware clock
  time = {
    timeZone = "Asia/Kolkata";
    hardwareClockInLocalTime = true;
  };

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Display Managers, Desktop Managers, Window Managers
  services = {
    displayManager = {
      sddm.enable = true;
    };

    desktopManager = {
      plasma6.enable = true;
    };

    xserver = {
      enable = true;

      xkb = {
        layout = "us";
        variant = "";
        options = "caps:swapescape";
      };

      displayManager = {
        lightdm.enable = false;
      };

      desktopManager = {
        pantheon.enable = false;
      };

      windowManager = {
        dwm = {
          enable = false;
          package = pkgs.dwm.overrideAttrs {
            src = /home/wolf/.config/dwm;
          };
        };

        bspwm.enable = true;
      };
    };

    # Enable CUPS to print documents
    printing.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      # jack.enable = true;
    };
  };

  # Enable Hyprland
  programs.hyprland.enable = true;

  # Enable RiverWM
  programs.river.enable = true;

  fonts.packages = with pkgs; [
    nerdfonts
    fira
    fira-code
    fira-code-symbols
  ];

  # Enable sound with pipewire
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  users.groups.seat.name = "seat";

  users.users.wolf = {
    isNormalUser = true;
    description = "Eklavya Sood";
    extraGroups = [ "networkmanager" "wheel" "seat" "video" ];
    packages = with pkgs; [
      #  thunderbird
    ];
  };

  # Install firefox
  programs.firefox.enable = true;

  # Install steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # Allow unfree software
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wlroots
    seatd
    sdnotify-wrapper
    hyprland
    waybar
    ly
    gcc
    unzip
    git
    vim
    neovim
    wget
    lutris
    wl-clipboard
    inputs.zen-browser.packages."${system}".default
    gnumake
    feh
    sxhkd
    alsa-utils
    xorg.xev
    playerctl
    nix-output-monitor
    nh
    zsh
    zsh-powerlevel10k
  ];

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/wolf/.dotfiles";
  };

  # Some programs need SUID wrappers, can be configured further or are started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon
  # services.openssh.enable = true;
  #
  # Open ports in the firewall
  # networking.firewall.allowedTCPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default 
  # settings for stateful data, like file locations and database versions 
  # on your system were taken. It's perfectly fine and recommended to leave 
  # this value at the release version of the first install of this system. 
  # Before changing this value read the documentation for this option 
  # (e.g man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
