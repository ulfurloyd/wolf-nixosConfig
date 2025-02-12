{ config, pkg, ... }:
{
  imports = [
    ./term
    ./shell
    ./wm
  ];
}
