#! /usr/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Make sure we have alacritty
if ! pacman -Qs alacritty > /dev/null ; then
	sudo pacman -S --needed --noconfirm alacritty
fi

# link files
for filename in $SCRIPT_DIR/*.toml; do
	ln -sfn $filename $HOME/.config/alacritty/
done
