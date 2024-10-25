{ pkgs, ... }:
{
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
  ];

  home.homeDirectory = "/Users/andrii";
  home.username = "andrii";

  home.file = {
    ".config".source = ../../config;
    ".config".recursive = true;
  };

  manual.manpages.enable = true;
  programs.man.enable = true;
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    htop
    direnv
    coreutils
    ripgrep
    ncdu
    cmake
    gnused
    wget
    pre-commit
    tectonic
    kubectl
    gnupg
    glew
    flux
    sops
    gradle
    zulu

    # Apps
    telegram-desktop
    alacritty
    obsidian
    spotify
    zoom-us

    # Fonts
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  fonts.fontconfig.enable = true;

  home.stateVersion = "24.05";
}
