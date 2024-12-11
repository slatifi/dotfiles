#!/bin/bash

VPN_STATUS=$(scutil --nwi | grep -E 'utun[0-9]*')

ICON=󰒙
if [ -n "$VPN_STATUS" ]; then
    ICON=
fi

sketchybar --set $NAME icon=$ICON
