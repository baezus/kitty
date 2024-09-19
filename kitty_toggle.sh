#!/bin/bash

# Check if Kitty's window is visible using xdotool
if xdotool search --class kitty > /dev/null; then
	# Try to minimize if active, or raise if minimized
	if xprop -id 33554446 | grep 'window state: Normal'; then
		xdotool search --class kitty windowminimize 
	else
		xdotool search --class kitty windowactivate
	fi
else
	# If no window is found, check if the process is running
	if ! pgrep -x kitty > /dev/null; then
		kitty & 
	fi
fi
