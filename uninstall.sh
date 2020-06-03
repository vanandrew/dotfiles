#!/bin/sh
# Uninstall script
[[ -f ~/.zshrc ]] && rm ~/.zshrc
[[ -f ~/.zsh_history ]] && rm ~/.zsh_history
[[ -d ~/.oh-my-zsh ]] && rm -rf ~/.oh-my-zsh
[[ -f ~/.p10k.zsh ]] && rm ~/.p10k.zsh
[[ -f ~/.login ]] && rm ~/.login
[[ -f ~/.login.bak ]] && mv ~/.login.bak ~/.login
[[ -f ~/.bash_profile ]] && rm ~/.bash_profile
[[ -f ~/.bash_profile.bak ]] && mv ~/.bash_profile.bak ~/.bash_profile
[[ -f ~/.cshrc ]] && rm ~/.cshrc
[[ -f ~/.cshrc.bak ]] && mv ~/.cshrc.bak ~/.cshrc
[[ -f ~/.bashrc ]] && rm ~/.bashrc
[[ -f ~/.bashrc.bak ]] && mv ~/.bashrc.bak ~/.bashrc
[[ -d ~/.dotfiles ]] && rm -rf ~/.dotfiles
echo "Uninstall Complete!"
