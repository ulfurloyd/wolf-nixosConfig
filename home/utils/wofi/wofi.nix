{ config, lib, ... }:
let
  font = config.stylix.fonts.sansSerif.name;
in
{
  programs.wofi = {
    enable = true;

    settings = {
      location = 6;
      height = 500;
      width = "30%";
      image_size = 28;

      allow_markup = true;
      allow_images = true;

      content_halign = "center";
      key_up = "Ctrl-p";
      key_down = "Ctrl-n";
    };

    style = lib.mkForce ''
      * {
        font-family: "${font}";
        font-size: 10pt;
      }
    '';
  };
}
