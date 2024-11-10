{ userSettings, ... }:
{
  programs.rofi = {
    enable = true;
    terminal = userSettings.term;
    cycle = true;
    font = userSettings.font + " 12";
    theme = "sidebar";

    extraConfig = {
      display-drun = "APPS";
      display-run = "RUN";
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
