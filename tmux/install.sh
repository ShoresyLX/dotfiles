#! /usr/bin/bash 

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
TMUX_CFG_DIR="$HOME/.config/tmux"

# Get dependencies
if ! pacman -Qs tmux > /dev/null ; then
	sudo pacman -S --noconfirm tmux
fi

if [ ! -d $TMUX_CFG_DIR ]; then
	mkdir $TMUX_CFG_DIR
fi

ln -sfn $SCRIPT_DIR/tmux.conf $TMUX_CFG_DIR/tmux.conf

# I put manual plugins in .config, tpm in .tmux.
# Little messy, but also easier to keep track of
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
