#! /usr/bin/bash

# Get current path so we're sure we find the files
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Make sure we have yay, then install konsave
if pacman -Qs yay > /dev/null ; then
	yay -S --noconfirm konsave
else
	echo 'please install yay'
	exit
fi

# Add profiles to konsave
for filename in $SCRIPT_DIR/*.ksnv; do
	konsave -i filename
done

# Enable default profile
konsave -a default
