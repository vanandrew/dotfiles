#!/bin/bash

STATE=$(xfconf-query -c xfce4-notifyd -p /do-not-disturb)

if [[ "$STATE" == "true" ]]; then
    xfconf-query -c xfce4-notifyd -p /do-not-disturb -T
    /home/vanandrew/.local/bin/notify-send.py -i notification-symbolic "Silent Mode OFF" --replaces-process disturb
else
    /home/vanandrew/.local/bin/notify-send.py -i notification-disabled-symbolic "Silent Mode ON  " --replaces-process disturb
    xfconf-query -c xfce4-notifyd -p /do-not-disturb -T
fi

