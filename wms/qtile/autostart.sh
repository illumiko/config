#!/bin/bash
picom -b &
dunst &
xrandr --output eDP --gamma 1:0.9:0.8 --brightness 0.8 &
xrandr --output eDP --auto --output HDMI-A-0 --auto --right-of eDP &
# ~/Downloads/libvibrant/build/vibrant-cli/vibrant-cli eDP 2
vibrant-cli HDMI-A-0 1.2
syncthing & 
xmodmap $HOME/dotfiles/wms/x11/xmodmap 
