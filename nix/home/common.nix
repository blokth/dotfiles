{ pkgs, config, ... }:
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
    cmake
    gnused
    wget
    pre-commit
    kubectl
    gnupg
    # nodejs
    # (python3.withPackages (python-pkgs: with python-pkgs; [
    #   uvicorn
    #   fastapi
    #   pyjwt
    #   sqlmodel
    #   python-multipart
    #   pytest
    #   httpx
    # ]))

    # Apps
    obsidian
    spotify
    zoom-us
    signal-desktop
    telegram-desktop
    docker

    # Fonts
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  fonts.fontconfig.enable = true;

  imports = [
    ./modules/bat.nix
    ./modules/zsh.nix
    ./modules/nvim.nix
    ./modules/bat.nix
    ./modules/eza.nix
    ./modules/fzf.nix
    ./modules/git.nix
    ./modules/oh-my-posh.nix
    ./modules/ripgrep.nix
    ./modules/tmux.nix
    ./modules/zoxide.nix
    ./modules/vscode.nix
    ./modules/alacritty.nix
    ./modules/ssh.nix
  ];

  home.stateVersion = "24.05";
}
