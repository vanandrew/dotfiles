#!/bin/bash
silent_mode_file=/tmp/silentmode

# check silent mode status
if [[ -f $silent_mode_file ]]; then
    rm $silent_mode_file
    notify-send.py a --hint boolean:deadd-notification-center:true string:type:unpausePopups && \
    notify-send.py "Silent Mode Off"
else
    touch $silent_mode_file
    notify-send.py "Silent Mode On" && \
    notify-send.py a --hint boolean:deadd-notification-center:true string:type:pausePopups
fi

