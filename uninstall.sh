#!/bin/sh
# Uninstall script
rm ~/.zsh*
rm -r ~/.oh-my-zsh
[ -f ~/.login.bak ] && mv ~/.login.bak ~/.login
