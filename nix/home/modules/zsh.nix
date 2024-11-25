{...}: {
  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    defaultKeymap = "emacs";
    history = {
      size = 5000;
      ignoreAllDups = true;
      ignoreDups = true;
      ignoreSpace = true;
      share = true;
    };

    shellAliases = {
      cat = "bat";
    };

    enableVteIntegration = true;

    initExtra = ''
      # Set the directory to store zinit and plugins
      ZINIT_HOME="$HOME/.local/share/zinit/zinit.git"

      # Download zinit, if not there
      if [ ! -d "$ZINIT_HOME" ]; then
          mkdir -p "$(dirname $ZINIT_HOME)"
          git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
      fi

      # Load zinit
      source "$ZINIT_HOME/zinit.zsh"

      # Add in snippets
      zinit snippet OMZP::git
      zinit snippet OMZP::kubectl
      zinit snippet OMZP::kubectx
      zinit snippet OMZP::sudo
      zinit snippet OMZP::command-not-found

      zinit cdreplay -q

      # Keybindings
      bindkey '^p' history-search-backward
      bindkey '^n' history-search-forward

      # Completion styling
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' list-colors "$LS_COLORS"
      zstyle ':completion:*' menu no
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --color $realpath'
      zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --color $realpath'

      if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
        tmux attach-session -t default || tmux new-session -s default
      fi

      eval "$(/opt/homebrew/bin/brew shellenv)"
    '';
  };

}
