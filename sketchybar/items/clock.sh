#!/bin/bash

clock=(
  icon=cal
  icon.padding_right=10
  label.width=45
  label.align=right
  padding_left=15
  update_freq=10
  script="$PLUGIN_DIR/clock.sh"
)

sketchybar --add item clock right       \
           --set clock "${clock[@]}" \
           --subscribe clock system_woke

