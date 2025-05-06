#!/bin/bash

CONFIG_FILES="$HOME/.config/waybar/config.jsonc $HOME/.config/waybar/style.css"

if pgrep -x "waybar" > /dev/null; then
    killall waybar
fi

while true; do
    waybar &
    inotifywait -e create,modify $CONFIG_FILES
    killall waybar
done
