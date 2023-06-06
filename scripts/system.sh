#!/usr/bin/env bash

echo "Configuring system..."

if [[ "$OS_NAME" = "osx" ]]; then
	NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	FORMULAE=(
		"bat"
		"cmake"
		"coreutils"
		"git"
		"llvm"
		"make"
		"neovim"
		"ninja"
		"node"
		"python@3.10"
		"ripgrep"
		"wget"
	)

	brew install ${FORMULAE[@]}

	CASKS=(
		"font-fira-code"
		"iterm2"
		"steam"
		"spotify"
		"rectangle"
	)

	brew install --cask ${CASKS[@]}
fi

if [[ "$OS_NAME" = "linux" ]]; then
	nc=$(grep -c ^processor /proc/cpuinfo)
	echo "You have " $nc" cores."
	echo "-------------------------------------------------"
	echo "Changing the makeflags for "$nc" cores."
	TOTALMEM=$(cat /proc/meminfo | grep -i 'memtotal' | grep -o '[[:digit:]]*')
	if [[  $TOTALMEM -gt 8000000 ]]; then
		sed -i "s/#MAKEFLAGS=\"-j2\"/MAKEFLAGS=\"-j$nc\"/g" /etc/makepkg.conf
		echo "Changing the compression settings for "$nc" cores."
		sed -i "s/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -T $nc -z -)/g" /etc/makepkg.conf
	fi

	echo "-------------------------------------------------"
	echo "Setting up mirrors for optimal download          "
	echo "-------------------------------------------------"
	pacman -S --noconfirm pacman-contrib curl
	pacman -S --noconfirm reflector rsync
	cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak

	#Add parallel downloading
	sed -i 's/^#Para/Para/' /etc/pacman.conf

	#Enable multilib
	sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
	pacman -Sy --noconfirm

	PKGS=(
		'steam'
		'python-pip'
		'fish'
		'neovim'
		'telegram-desktop'
		'htop'
		'base-devel'
	)

	pacman -S --noconfirm --needed ${PKGS[@]}

	PKGS_TO_REMOVE=(
		'qt5-tools'
		'firefox'
		'yakuake'
	)

	pacman -Rs --noconfirm ${PKGS_TO_REMOVE[@]}
fi

exit
