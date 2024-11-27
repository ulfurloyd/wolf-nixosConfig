{ lib, ... }:
{
  programs.starship = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;

    settings = {
      add_newline = false;
      command_timeout = 2000;
      scan_timeout = 10;

      format = lib.concatStrings [
        "$directory"
        "$git_branch "
        "$git_metrics"
        "$fill"
        "$time"
        "$line_break"
        "$character"
      ];

      fill = {
        disabled = false;
        symbol = " ";
      };

      character = {
        success_symbol = "❯";
        error_symbol = "❯";
      };

      git_branch = {
        symbol = "on ";
        format = lib.concatStrings [ 
          "$symbol"
          "$branch"
        ];
      };

      git_metrics = {
        disabled = false;
      };

      time = {
        disabled = false;

        format = lib.concatStrings [
          "at $time"
        ];
      };
    };
  };
}
