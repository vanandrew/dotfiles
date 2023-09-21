#!/bin/bash

CONFIG_FILES="$HOME/.config/waybar/config $HOME/.config/waybar/style.css $HOME/.cache/wal/colors-waybar.css"
trap "killall waybar" EXIT
waybar &
while true; do
    inotifywait -e create,modify $CONFIG_FILES
    killall -s SIGUSR2 waybar
done

