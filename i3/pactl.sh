#!/bin/bash

SINK=0

cmd="$1"
case $cmd in
  mute)
    exec pactl set-sink-mute $SINK true
    ;;
  unmute)
    exec pactl set-sink-mute $SINK false
    ;;
  toggle)
    exec pactl set-sink-mute $SINK toggle
    ;;
esac

exit 1
