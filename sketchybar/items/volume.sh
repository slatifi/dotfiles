#!/bin/bash

sketchybar --add item volume right \
           --set volume script="$PLUGIN_DIR/volume.sh" padding_left=5 \
           --subscribe volume volume_change
