#!/usr/bin/env bash

echo "Configuring user..."

SCRIPT_DIRECTORY="$(dirname "$0")"

mkdir -p "$HOME/.config/nvim/lua"

git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

ln -s "$SCRIPT_DIRECTORY/init.lua" "$HOME/.config/nvim/init.lua"
ln -s "$SCRIPT_DIRECTORY/lua" "$HOME/.config/nvim"

if [ "$OS_NAME" = "osx" ]; then
	rm -rf "$HOME/.zshrc"
	ln -s "$SCRIPT_DIRECTORY/.zshrc" "$HOME/.zhsrc"
fi

if [ "$OS_NAME" = "linux" ]; then
	echo "Installing yay"

	mkdir -p "$HOME/temp/yay"

	git clone "https://aur.archlinux.org/yay.git" "$HOME/temp/yay"

	cd "$HOME/temp/yay" || exit

	makepkg -si --noconfirm

	PKGS=(
		'nerd-fonts-fira-code'
		'spotify'
	)

	yay -S --noconfirm --needed "${PKGS[@]}"

	export PATH=$PATH:~/.local/bin
fi

echo -e "\nDone\n"
exit
