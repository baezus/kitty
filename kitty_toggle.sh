#!/bin/bash

# Create variable for the Kitty window
KITTYWINDOW = $(xdotool search --class kitty)
echo "@" "$KITTYWINDOW"

# Check if Kitty's window is visible using xdotool
if xdotool search --class kitty > /dev/null; then
	# Try to minimize if active, or raise if minimized
	if xprop -id 6291470 | grep 'window state: Normal'; then
		xdotool search --class kitty windowminimize 
	else
		xdotool search --class kitty windowactivate
	fi
else
	# If no window is found, check if the process is running. If not, run process
	if ! pgrep -x kitty > /dev/null; then
		kitty & 
	fi
fi
