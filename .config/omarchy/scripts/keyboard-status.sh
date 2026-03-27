#!/bin/bash

# Check internal keyboard status and return JSON for Waybar
KEYBOARD_NAME="at-translated-set-2-keyboard"
STATE_FILE="$HOME/.cache/keyboard-state"

# Check if keyboard exists
keyboard_exists=$(hyprctl devices -j | jq -r ".keyboards[] | select(.name == \"$KEYBOARD_NAME\") | .address" 2>/dev/null)

if [ -z "$keyboard_exists" ]; then
    echo '{"text":"","tooltip":"Internal keyboard not found","class":"error"}'
    exit 0
fi

# Initialize state file if it doesn't exist
if [ ! -f "$STATE_FILE" ]; then
    # Check config file for initial state
    if grep -q "enabled = false" ~/.config/hypr/input.conf; then
        echo "disabled" > "$STATE_FILE"
    else
        echo "enabled" > "$STATE_FILE"
    fi
fi

# Read current state from state file
current_state=$(cat "$STATE_FILE" 2>/dev/null || echo "disabled")

if [ "$current_state" = "disabled" ]; then
    # Keyboard is disabled
    echo '{"text":"󰌐","tooltip":"Internal keyboard: Disabled (click to enable)","class":"disabled"}'
else
    # Keyboard is enabled
    echo '{"text":"󰌌","tooltip":"Internal keyboard: Enabled (click to disable)","class":"enabled"}'
fi
