#!/bin/sh
# Uninstall script
rm ~/.zsh*
rm ~/.zcompdump*
rm -rf ~/.oh-my-zsh
[ -f ~/.login.bak ] && mv ~/.login.bak ~/.login
rm ~/.startup
rm ~/.p10k.zsh
rm -rf ~/.dotfiles
