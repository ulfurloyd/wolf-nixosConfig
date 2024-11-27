{ lib, userSettings, pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    terminal = userSettings.term;
    cycle = true;
    font = lib.mkForce "${userSettings.font} 13";

    plugins = with pkgs; [ 
      rofi-emoji
    ];

    extraConfig = {
      display-drun = "Apps";
      display-run = "Run";
      display-emoji = "Emoji";
      display-filebrowser = "FILES";
      display-window = "WINDOW";
	    drun-display-format = "{name}";
      hover-select = true;
      me-select-entry = "";
      me-accept-entry = "MousePrimary";
      window-format = "{w} · {c} · {t}";
    };
  };
}
