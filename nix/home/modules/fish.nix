{config, ...}: {
  xdg.configFile.fish = {
    enable = true;
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/fish";
  };
}
