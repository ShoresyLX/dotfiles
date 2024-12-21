#! /usr/bin/bash 

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Get dependencies
if ! pacman -Qs whipper > /dev/null ; then
	sudo pacman -S --noconfirm whipper
fi

if [ ! -d "$HOME/.config/whipper"]; then
	mkdir $HOME/.config/whipper
fi

ln -sfn $SCRIPT_DIR/whipper.conf $HOME/.config/whipper.conf
