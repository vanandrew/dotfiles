#!/bin/bash

STATE=$(xfconf-query -c xfce4-notifyd -p /do-not-disturb)

if [[ "$STATE" == "true" ]]; then
    xfconf-query -c xfce4-notifyd -p /do-not-disturb -T && \
    notify-send -i notification-symbolic "Silent Mode OFF" -r 444
else
    notify-send -i notification-disabled-symbolic "Silent Mode ON" -r 444 --wait && \
    xfconf-query -c xfce4-notifyd -p /do-not-disturb -T
fi

