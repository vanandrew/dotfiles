#!/bin/bash

# this should only be run in the current directory where sync.sh lives

# config paths to sync
paths=(
  anyrun
  btop
  fusuma
  hypr
  kitty
  mpd
  mpv
  ncmpcpp
  neofetch
  systemd
  waybar
)

files=(
  chrome-flags.conf
)

# loop over paths to sync
for p in ${paths[@]}; do
  # first, check if the path exists at the destination, if not copy the config to the destination 
  [ ! -d ~/.config/${p} ] && cp -rv ${p} ~/.config/ && continue

  # if we didn't copy anything over then copy stuff back to this directory
  # first delete
  rm -rf ${p}
  # now copy things over
  cp -rv ~/.config/${p} ./
done

# loop over files to sync
for f in ${files[@]}; do
  [ ! -f ~/.config/${f} ] && cp -v ${f} ~/.config/ && continue
  rm -rf ${f}
  cp -rv ~/.config/${f} ./
done

