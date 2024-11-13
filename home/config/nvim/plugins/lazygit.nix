{ config, pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      lazygit = {
        enable = true;
      };
    };
  };
}
