#! /usr/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Get dependencies
if ! pacman -Qs neovim > /dev/null ; then
	sudo pacman -S --noconfirm neovim
fi

if [ ! -d "$HOME/.config/nvim"]; then
	mkdir $HOME/.config/nvim
fi

for filename in $SCRIPT_DIR/*; do
	ln -sfn $SCRIPT_DIR/$filename $HOME/.config/nvim/$filename
done
