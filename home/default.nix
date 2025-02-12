{
  pkgs,
  username,
  stateVersion,
  ...
}: let
  inherit (pkgs.stdenv) isDarwin isLinux;
in {
  home = {
    inherit stateVersion;
    inherit username;
    homeDirectory =
      if isDarwin
      then "/Users/${username}"
      else if isLinux
      then "/home/${username}"
      else "/";

    packages = with pkgs; [
      htop
      direnv
      coreutils
      ripgrep
      gnused
      wget
      pre-commit
      kubectl
      gnupg
      sops
      nodejs
      luarocks
      cargo
      watch
      yq
      zig
      utm
      argocd
      # Command-line benchmarking tool
      hyperfine
      # A better df alternative
      duf
      # A simple, fast and user-friendly alternative to find
      fd
      # Simplified man pages with practical examples
      tldr
      # A smarter cd
      zoxide
      # Dig on steroid
      doggo

      (python3.withPackages (python-pkgs:
        with python-pkgs; [
          fastapi
          uvicorn
          pyjwt
          sqlmodel
          python-dotenv
          python-multipart
          openai
          pytest
          httpx
        ]))

      # Apps
      qbittorrent
    ];

    sessionVariables = {
      EDITOR = "nvim";
      MANPAGER = "sh -c 'col --no-backspaces --spaces | bat --language man'";
      MANROFFOPT = "-c";
      PAGER = "bat";
      SYSTEMD_EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  manual.manpages.enable = true;
  programs.man.enable = true;
  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  imports = [
    ./modules/bat.nix
    ./modules/nvim.nix
    ./modules/eza.nix
    ./modules/fzf.nix
    ./modules/git.nix
    ./modules/ripgrep.nix
    ./modules/tmux.nix
    ./modules/zoxide.nix
    ./modules/vscode.nix
    ./modules/ssh.nix
    ./modules/ghostty.nix
  ];
}
