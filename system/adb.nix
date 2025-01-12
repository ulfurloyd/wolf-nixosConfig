{ userSettings, ... }:
{
  programs.adb.enable = true;
  users.users.wolf.extraGroups = [ "adbusers" ];
}
