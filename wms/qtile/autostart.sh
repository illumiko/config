#!/bin/bash
picom -b &
dunst &
xrandr --output eDP --gamma 1:0.9:0.8 --brightness 0.8 &
~/Downloads/libvibrant/build/vibrant-cli/vibrant-cli eDP 2

