{config, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  xdg.configFile.neovim = {
    enable = true;
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/nvim";
    target = "nvim";
  };
}
