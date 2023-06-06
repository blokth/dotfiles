#!/usr/bin/env bash

echo "Configuring user..."

SCRIPT_DIRECTORY="$(dirname "$0")"

mkdir -p $HOME/.config/nvim

ln -s "$SCRIPT_DIRECTORY/init.lua" "$HOME/.config/nvim/init.lua"

if [ "$OS_NAME" = "osx" ]; then
	rm -rf $HOME/.zprofile
	ln -s "$SCRIPT_DIRECTORY/.zprofile" "$HOME/.zprofile"
fi

if [ "$OS_NAME" = "linux" ]; then
	echo "Installing yay"

	mkdir -p $HOME/temp/yay

	git clone "https://aur.archlinux.org/yay.git" $HOME/temp/yay

	cd $HOME/temp/yay

	makepkg -si --noconfirm

	PKGS=(
		'nerd-fonts-fira-code'
		'spotify'
	)

	yay -S --noconfirm --needed ${PKGS[@]}

	export PATH=$PATH:~/.local/bin
fi

echo -e "\nDone\n"
exit
