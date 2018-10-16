#!/bin/bash

# Get the selected sink volume
get_volume() {
  local sink="$1"
  pacmd list-sinks |
    awk '/^\svolume:/{i++} i==('$sink'+1){print $5; exit}' |
    awk -F"%" '{print $1}'
}

get_volume_icon() {
  local vol="$1"
  local icon

  if [ "${vol}" -eq "100" ]; then
      icon="stock_volume-max"
  elif [ "${vol}" -ge "70" ]; then
      icon="stock_volume-high"
  elif [ "${vol}" -ge "40" ]; then
      icon="stock_volume-med"
  elif [ "${vol}" -gt "0" ]; then
      icon="stock_volume-min"
  else
      icon="stock_volume-0"
  fi

  echo "${icon}"
}

notify_volume() {
    local sink="$1"
    vol=$(get_volume "$sink")
    icon=$(get_volume_icon "$vol")
    notify-send -a $(basename $0) -i "${icon}" -h int:value:"${vol}" -h string:synchronous:volume "Volume ${vol}%"
}

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
  volume)
    pactl set-sink-volume $SINK $2
    notify_volume $SINK
    ;;
esac

exit 1
