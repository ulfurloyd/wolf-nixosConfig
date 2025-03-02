{ pkgs, ... }:
{
  imports = [
    ../../home/lykaon
    ../../home/common
  ];

  home.packages = with pkgs; [
    brightnessctl
    android-studio
    speedtest-cli
    xwayland-satellite
    libsForQt5.qt5.qtwayland
  ];
}
