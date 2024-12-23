#! /usr/bin/bash 

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Get dependencies
if ! pacman -Qs fish > /dev/null ; then
	sudo pacman -S --noconfirm fish 
fi
if ! pacman -Qs fortune-mod > /dev/null ; then
	sudo pacman -S --noconfirm fortune-mod
	# Setup fortune-mod
	sudo cp $SCRIPT_DIR/misc/* /usr/share/fortune/
fi
if ! pacman -Qs ttf-sourcecodepro-nerd > /dev/null ; then
	sudo pacman -S --noconfirm ttf-sourcecodepro-nerd
fi

# Keep this updated as needed
FISH_LIST=("config.fish" "fish_plugins")
FUNCTION_LIST=("dvdtitle" "fish_greeting" "getip" "rswf" "sy_fish_config")

# Make sure directories are present
if [ ! -d "$HOME/.config/fish" ]; then
	mkdir $HOME/.config/fish
	mkdir $HOME/.config/fish/functions
fi
if [ ! -d "$HOME/.config/fish/functions" ]; then
	mkdir $HOME/.config/fish/functions 
fi

# Link custom files
for filename in ${FISH_LIST[@]}; do
	ln -sfn $SCRIPT_DIR/$filename $HOME/.config/fish/
done

for filename in ${FUNCTION_LIST[@]}; do
	ln -sfn $SCRIPT_DIR/functions/$filename.fish $HOME/.config/fish/functions/$filename.fish
done

# Configure Fish
env fish -c sy_fish_config
