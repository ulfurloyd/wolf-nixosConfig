{ pkgs, ... }:
{
  programs.zsh = {
    dotDir = ".config/zsh";
    autosuggestion.enable = true;
    enableCompletion = true;

    initExtraFirst = ''
      echo
      pfetch
    '';

    initExtra = ''
      
      setopt appendhistory

      bindkey '^f' autosuggest-accept
      bindkey '^p' history-search-backward
      bindkey '^n' history-search-forward

      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' menu no

      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa $realpath'
      zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'exa $realpath'

      [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

      unset ZSH_AUTOSUGGEST_USE_ASYNC
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
        { 
          name = "romkatv/powerlevel10k"; 
          tags = [ 
            "as:theme"
            "depth:1"
          ];
        }
      ];
    };
  };
}
