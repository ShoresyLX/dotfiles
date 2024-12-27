#! /usr/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

sudo pacman -S --needed --noconfirm neovim python-rope python-pyflakes python-macabe python-pycodestyle yapf python-whatthepatch python-lsp-server

if [ ! -d "$HOME/.config/nvim"]; then
	mkdir $HOME/.config/nvim
fi

for filename in $SCRIPT_DIR/*; do
	ln -sfn $SCRIPT_DIR/$filename $HOME/.config/nvim/$filename
done
