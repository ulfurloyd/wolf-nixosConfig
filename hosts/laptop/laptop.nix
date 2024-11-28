{ config, pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../stylix/laptop
    ../../system
  ];

  networking.hostName = "wolfNixLap";

  services.auto-cpufreq = {
    enable = false;
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
