#!/bin/bash
if [ "$1" = 'light' ]; then
    cat ./color_light.css > ./colors.css
elif [ "$1" = 'dark' ]; then
    cat ./color_dark.css > ./colors.css
else
    echo "Error: Invalid argument. Use 'light' or 'dark'."
    exit 1
fi

# Restart Waybar
if pgrep waybar > /dev/null; then
    killall waybar
fi
waybar &
echo "Waybar restarted."
