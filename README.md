# Dotfiles

This repo contains config files (dotfiles) to provide consistent
experience across devices.

To manage these files I use [GNU Stow](https://www.gnu.org/software/stow/). It
set ups symlinks for all dotfiles with this singe command:

```sh
stow .
```

## Contents

- zsh with customized [Oh My Posh](https://ohmyposh.dev/) theme and
  [zinit](https://github.com/zdharma-continuum/zinit) plugin manager
- [Alacritty](https://alacritty.org/)
- Neovim with [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
- Tmux with [tpm](https://github.com/tmux-plugins/tpm)
- Brewfile
- MacOS settings

## Inspiration

The inspiration for this setup came from the videos of
[Elliot Minns](https://github.com/elliottminns) and his
[Dreams of Autonomy](https://www.youtube.com/@dreamsofautonomy).
