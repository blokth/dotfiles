{
  programs.git = {
    enable = true;
    userName = "Andrii Olkhovych";
    userEmail = "andrii.olkhovych@pm.me";
    signing.key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF5WXSF7FL2yTpqQjsZlSkIkvs7KqYxovtj3qWP72ayH";
    signing.signByDefault = true;
    delta = {
      enable = true;
      options = {
        features = "unobtrusive-line-numbers decorations";
        syntax-theme = "Monokai Extended Bright";
        whitespace-error-style = "22 reverse";

        decorations = {
          commit-decoration-style = "bold yellow box ul";
          file-decoration-style = "none";
          file-style = "bold yellow ul";
          hunk-header-decoration-style = "yellow box";
        };

        unobtrusive-line-numbers = {
          line-numbers = true;
          line-numbers-left-format = "{nm:>4}┊";
          line-numbers-left-style = "#444444";
          line-numbers-minus-style = "#444444";
          line-numbers-plus-style = "#444444";
          line-numbers-right-format = "{np:>4}│";
          line-numbers-right-style = "#444444";
          line-numbers-zero-style = "#444444";
        };
      };
    };
    ignores = [
      # Swap
      "[._]*.s[a-v][a-z]"
      "[._]*.sw[a-p]"
      "[._]s[a-v][a-z]"
      "[._]sw[a-p]"
      ".aider*"
      # System
      ".DS_Store"
      "**/.DS_Store"
      # Env
      ".env*"
      "**/.env*"
    ];
    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      gpg.format = "ssh";
      gpg.ssh.program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      core = {
        editor = "nvim";
        fsmonitor = true;
        untrackedcache = true;
      };
      fetch.prune = true;
      grep.lineNumber = true;
      help.autocorrect = 1;
      pull.rebase = true;
    };
  };
}
