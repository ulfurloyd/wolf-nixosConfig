{ config, pkg, ... }:
{
  imports = [
    ./term
    ./shell
    ./nvim
    ./wm
  ];
}
