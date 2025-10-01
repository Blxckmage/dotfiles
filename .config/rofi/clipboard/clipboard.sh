#!/bin/bash
dir="$HOME/.config/rofi/clipboard/"
cliphist list | rofi -dmenu -display-columns 2 -theme "${dir}/theme.rasi" | cliphist decode | wl-copy
