{ pkgs, ... }:
{
  home.homeDirectory = "/Users/andrii";
  home.username = "andrii";

  manual.manpages.enable = true;
  programs.man.enable = true;
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
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
    fluxcd
    nodejs
    luarocks
    cargo
    watch
    yq

    # Apps
    qbittorrent
    obsidian
    spotify
    zoom-us
    signal-desktop
    telegram-desktop
    docker

    # Fonts
    nerd-fonts.jetbrains-mono
  ];

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

  home.stateVersion = "24.05";
}
