#!/bin/bash

# First, see if Kitty is open at all
echo "Checking if Kitty is running ... "

# Check if Kitty's window is visible using xdotool
if xdotool search --class kitty > /dev/null; then
	echo "Kitty window found, toggling ..."
	# Try to minimze if active, or raise if minimized
	if xprop -id 33554446 | grep 'window state: Normal'; then
	# if xdotool search --class kitty getwindowfocus getwindowpid > /dev/null; then
		echo "Minimizing Kitty window"
		xdotool search --class kitty windowminimize 
	else
	# if xprop -id 0x200000f; then
		echo "Bringing kitty window to the foreground"
		xdotool search --class kitty windowactivate
	fi
else
	# If no window is found, check if the process is running
	if ! pgrep -x kitty > /dev/null; then
		echo "Kitty is not running, launching ..."
		kitty & 
		echo "Launched Kitty"
	fi
fi
