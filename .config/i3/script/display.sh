#!/bin/bash

# Get the connected display names
connected_displays=$(xrandr -q | awk '/ connected/{print $1}')

if [[ $connected_displays =~ "HDMI-1" ]]; then
  xrandr --output eDP-1 --off --output HDMI-1 --primary --auto
else
  xrandr --output eDP-1 --primary --auto
fi
