{ config, ... }:
{
  programs.alacritty.enable = true;

  xdg.configFile.alacritty = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/alacritty";
  };
}
