{
  programs.git = {
    enable = true;

    userName = "ulfurloyd";
    userEmail = "eklavyasood@gmail.com";

    extraConfig = {
      advice = {
        addEmptyPathspec = false;
        pushNonFastForward = false;
        statusHints = false;
      };

      core = {
        compression = 9;
        whitespace = "error";
        preloadindex = true;
      };

      commit.template = "~/.gitmessage";

      init.defaultBranch = "main";

      pull = {
        default = "current";
        rebase = true;
      };

      push = {
        autoSetupRemote = true;
        default = "current";
        followTags = true;
      };

      rebase = {
        autoStash = true;
        missingCommitsChecks = "warn";
      };

      status = {
        branch = true;
        showStash = true;
      };
    };
  };

  home.file.".gitmessage".source = ./.gitmessage;
}
