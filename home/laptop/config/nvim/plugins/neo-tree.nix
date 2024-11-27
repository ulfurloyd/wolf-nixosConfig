{
  programs.nixvim.plugins.neo-tree = {
    enable = true;
    enableGitStatus = true;
    enableRefreshOnWrite = true;
    addBlankLineAtTop = true;
    autoCleanAfterSessionRestore = true;
    closeIfLastWindow = true;
  };
}
