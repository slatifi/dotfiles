#!/bin/bash

IP="$(ipconfig getsummary en0 | grep -o "yiaddr = .*" | sed 's/^yiaddr = //')"

ICON=󰤯
if [ -n "$IP" ]; then
    ICON=
fi

sketchybar --set $NAME icon=$ICON
