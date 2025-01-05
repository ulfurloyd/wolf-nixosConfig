{ inputs, pkgs, ... }:
{
  programs.anyrun = {
    enable = true;
    
    config = {
      x = { fraction = 0.5; };
      y = { fraction = 0.3; };
      width = { fraction = 0.3; };
      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = false;
      closeOnClick = false;
      showResultsImmediately = false;
      maxEntries = null;
      
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        rink
      ];
    };
  };
}
