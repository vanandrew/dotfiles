#!/bin/sh
# Uninstall script
[[ -f ~/.zshrc ]] && rm ~/.zshrc
[[ -f ~/.zsh_history ]] && rm ~/.zsh_history
[[ -f ~/.zcompdump* ]] && rm ~/.zcompdump*
[[ -d ~/.oh-my-zsh ]] && rm -rf ~/.oh-my-zsh
[[ -f ~/.p10k.zsh ]] && rm ~/.p10k.zsh
[[ -f ~/.login ]] && rm ~/.login
[[ -f ~/.login.bak ]] && mv ~/.login.bak ~/.login
[[ -f ~/.bash_profile ]] && rm ~/.bash_profile
[[ -f ~/.bash_profile.bak ]] && mv ~/.bash_profile.bak ~/.bash_profile
[[ -d ~/.dotfiles ]] && rm -rf ~/.dotfiles
echo "Uninstall Complete!"
