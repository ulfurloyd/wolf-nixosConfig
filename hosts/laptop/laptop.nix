{ config, pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../stylix/laptop
    ../../system
  ];

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    wpa_supplicant_gui
  ];

  networking = {
    wireless = {
      enable = true;
      userControlled.enable = true;
      networks =  {
        "ACT_5G" = {
          pskRaw = "f36bdb9db3c05809bab35ac05ebe68b36304638b82012eb6cb94114f1e7267e0";
        };
      };
    };
  };

  networking.hostName = "wolfNixLap";

  services.power-profiles-daemon.enable = false;
  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = { 
        governor = "powersave";
        turbo = "never";
      };

      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };
}
