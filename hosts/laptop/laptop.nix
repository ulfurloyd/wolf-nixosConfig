{ config, pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../stylix/laptop
    ../../system
  ];

  networking.hostName = "wolfNixLap";

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
