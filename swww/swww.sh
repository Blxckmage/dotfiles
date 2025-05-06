#!/bin/bash

DIR=$HOME/Pictures/wallpapers/
PICS=($(ls ${DIR}))

RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}

if [[ $(pidof swaybg) ]]; then
  pkill swaybg
fi

swww query || swww init

swww img ${DIR}/${RANDOMPICS} --transition-fps 30 --transition-type any --transition-duration 3
