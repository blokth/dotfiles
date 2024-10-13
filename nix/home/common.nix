{ pkgs, ... }:
{
  imports = [
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
  ];

  services.bat.enable = true;

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
    ncdu
    gnused
    wget
    pre-commit
    kubectl
    gnupg
    flux
    sops

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
