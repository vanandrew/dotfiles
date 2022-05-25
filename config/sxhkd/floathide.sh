#!/bin/sh

if bspc query -N -n .hidden; then
    # If there are hidden windows show them and exit the script
    # this is to prevent having 2 sets of floating windows toggling each other
    for i in $(bspc query -N -n .hidden); do
        bspc node $i -g hidden=off
    done
    # focus the last toggled window
    bspc node --focus $i
    exit 0
fi

for i in $(bspc query -N -n .floating); do
    # Otherwise, hide every floating window
    bspc node $i -g hidden=on
done

