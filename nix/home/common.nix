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
    tectonic
    kubectl
    python3
    gnupg
    glew
    flux
    sops
    gradle
    zulu

    # Apps
    telegram-desktop
    obsidian
    spotify
    zoom-us

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
