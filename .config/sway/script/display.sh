#!/bin/bash

connected_outputs=$(swaymsg -t get_outputs | jq -r '.[] | select(.active == true) | .name')

if echo "$connected_outputs" | grep -q "HDMI-A-1"; then
  swaymsg output eDP-1 disable
  swaymsg output HDMI-A-1 enable
  swaymsg output HDMI-A-1 pos 0 0
else
  swaymsg output eDP-1 enable
  swaymsg output eDP-1 pos 0 0
fi
