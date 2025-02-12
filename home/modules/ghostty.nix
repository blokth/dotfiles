{config, ...}: {
  xdg.configFile.ghostty = {
    enable = true;
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/ghostty";
  };
}
