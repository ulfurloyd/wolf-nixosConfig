{ pkgs, ... }:
{
  programs.zsh = {
    dotDir = ".config/zsh";
    autosuggestion.enable = true;
    enableCompletion = true;

    initExtraFirst = ''
      fastfetch
    '';

    initExtra = ''
      setopt appendhistory

      bindkey '^f' autosuggest-accept
      bindkey '^p' history-search-backward
      bindkey '^n' history-search-forward

      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' menu no

      [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

      unset ZSH_AUTOSUGGEST_USE_ASYNC

      # extra line after every command, to work with starship's add_newline = false
      precmd() {
        precmd() {
          echo
        }
      }
    '';

    initExtraBeforeCompInit = ''
      bindkey -v

      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa $realpath'
      zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'exa $realpath'
    '';

    envExtra = ''
      skip_global_compinit=1
    '';

    history = {
      size = 5000;
      share = true;
      ignoreDups = true;
      ignoreSpace = true;
    };

    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
        { name = "zsh-users/zsh-completions"; }
        { name = "Aloxaf/fzf-tab"; }
        # { 
        #   name = "romkatv/powerlevel10k"; 
        #   tags = [ 
        #     "as:theme"
        #     "depth:1"
        #   ];
        # }
        { name = "joshskidmore/zsh-fzf-history-search"; }
      ];
    };
  };
}
