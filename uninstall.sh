#!/bin/bash
# Uninstall script
[[ -f ~/.zshrc ]] && rm ~/.zshrc
[[ -f ~/.zsh_history ]] && rm ~/.zsh_history
[[ -d ~/.oh-my-zsh ]] && rm -rf ~/.oh-my-zsh
[[ -f ~/.p10k.zsh ]] && rm ~/.p10k.zsh
[[ -d ~/.dotfiles ]] && rm -rf ~/.dotfiles
echo "Uninstall Complete!"
