#!/bin/bash

# Toggle internal laptop keyboard on/off
KEYBOARD_NAME="at-translated-set-2-keyboard"
STATE_FILE="$HOME/.cache/keyboard-state"

# Initialize state file if it doesn't exist
if [ ! -f "$STATE_FILE" ]; then
    # Check config file for initial state
    if grep -q "enabled = false" ~/.config/hypr/input.conf; then
        echo "disabled" > "$STATE_FILE"
    else
        echo "enabled" > "$STATE_FILE"
    fi
fi

# Read current state
current_state=$(cat "$STATE_FILE" 2>/dev/null || echo "disabled")

if [ "$current_state" = "disabled" ]; then
    # Currently disabled, enable it
    hyprctl keyword "device[${KEYBOARD_NAME}]:enabled" true
    echo "enabled" > "$STATE_FILE"
    notify-send "Keyboard Enabled" "Internal keyboard is now active" -t 2000
else
    # Currently enabled, disable it
    hyprctl keyword "device[${KEYBOARD_NAME}]:enabled" false
    echo "disabled" > "$STATE_FILE"
    notify-send "Keyboard Disabled" "Internal keyboard is now inactive" -t 2000
fi

# Signal waybar to update (signal 9)
pkill -RTMIN+9 waybar
