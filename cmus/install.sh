#! /usr/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if ! pacman -Qs cmus > /dev/null ; then
	sudo pacman -S --needed cmus
fi

for filename in $SCRIPT_DIR/*.theme; do
	ln -sfn $SCRIPT_DIR/$filename $HOME/.config/cmus/$filename
done

