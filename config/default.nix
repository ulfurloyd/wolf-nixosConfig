{ config, pkg, ... }:
{
  imports = [
    ./term
    ./shell
    ./nvim
    ./stylix
    ./wm
  ];
}
