#! /usr/bin/bash 

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Get dependencies
if ! pacman -Qs fish > /dev/null ; then
	sudo pacman -S --noconfirm fish 
fi
if ! pacman -Qs fortune-mod > /dev/null ; then
	sudo pacman -S --noconfirm fortune-mod
fi
if ! pacman -Qs ttf-sourcecodepro-nerd > /dev/null ; then
	sudo pacman -S --noconfirm ttf-sourcecodepro-nerd
fi

# Setup fortune-mod
sudo cp $SCRIPT_DIR/misc/* /usr/share/fortune/

# Keep this updated as needed
FISH_LIST=("config.fish" "fish_plugins")
FUNCTION_LIST=("dvdtitle" "fish_greeting" "getip" "rswf")

# Make sure directories are present
if [ ! -d "$HOME/.config/fish"]; then
	mkdir $HOME/.config/fish
	mkdir $HOME/.config/fish/functions
fi
if [ ! -d "$HOME/.config/fish/functions"]; then
	mkdir $HOME/.config/fish/functions 
fi

# Link custom files
for filename in $FISH_LIST; do
	ln -sfn $SCRIPT_DIR/$filename $HOME/.config/fish/$filename
end

for filename in $FUNCTION_LIST; do
	ln -sfn $SCRIPT_DIR/functions/$filename $HOME/.config/fish/functions/$filename
end

# Install fisher
env fish -c curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher 

# Grab and configure plugins
env fish -c fisher update
env fish -c tide configure --auto --style=Classic --prompt_colors='True color' --classic_prompt_color=Dark --show_time='24-hour format' --classic_prompt_separators=Round --powerline_prompt_heads=Round --powerline_prompt_tails=Sharp --powerline_prompt_style='Two lines, character and frame' --prompt_connection=Solid --powerline_right_prompt_frame=No --prompt_connection_andor_frame_color=Lightest --prompt_spacing=Compact --icons='Many icons' --transient=No
env fish -c fish_config theme save "Catppuccin Macchiato"
