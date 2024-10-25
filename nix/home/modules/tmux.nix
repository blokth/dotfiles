{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    prefix = "C-Space";
    keyMode = "vi";
    mouse = true;
    baseIndex = 1;
    escapeTime = 0;
    terminal = "tmux-256color";
    extraConfig = ''
      # keybindings
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"

      set -as terminal-features ",alacritty*:RGB"

      set -g default-command "${pkgs.zsh}/bin/zsh"
    '';

    plugins = with pkgs.tmuxPlugins; [
      yank
      vim-tmux-navigator
    ];
  };
}
