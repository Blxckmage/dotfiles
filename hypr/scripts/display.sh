#!/bin/bash

connected_displays=$(hyprctl monitors | grep "Monitor" | awk '{print $2}')

if echo "$connected_displays" | grep -q "HDMI-A-1"; then
  hyprctl dispatch dpms off eDP-1
  hyprctl dispatch dpms on HDMI-A-1
  hyprctl keyword monitor "HDMI-A-1,preferred,auto,1"
  hyprctl keyword monitor "eDP-1,disable"

  hyprctl dispatch moveworkspacetomonitor 1 HDMI-A-1
  hyprctl dispatch workspace 1
else
  hyprctl dispatch dpms on eDP-1
  hyprctl keyword monitor "eDP-1,preferred,auto,1"
  hyprctl keyword monitor "HDMI-A-1,disable"

  hyprctl dispatch moveworkspacetomonitor 1 eDP-1
  hyprctl dispatch workspace 1
fi
