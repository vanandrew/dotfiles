#!/bin/sh
# This file is setup to modify the .login
# file in the user's home directory
#
# It backs up the previous .login file as
# .login.bak

# query user input for install
echo "This will setup Andrew's sane lab dotfiles."
read -p "DO NOT RUN THIS SCRIPT TWICE, as you will probably screw things up... Continue? [y/N]: " vcontinue
if [[ $vcontinue == "Y" ]]; then
  vcontinue="y"
fi
[[ $vcontinue != "y" ]] && echo "Quitting... Not installed." && exit 0

# copy the current login file if it exists
if [ -f ~/.login ]; then # for csh
    echo "Backing up old .login file..."
    # make copy of .login for backup
    cp ~/.login ~/.login.bak
    # now we can generate a new .login file; injecting
    # our custom startup script that we will generate soon
    echo "Making new .login file..."
    head -n 1 ~/.login > ~/.login.new
    echo "### AUTOMATICALLY GENERATED BY ANDREW'S SANE LAB DOTFILES SCRIPT ###" >> ~/.login.new
    echo "source ~/.startup" >> ~/.login.new
    echo "### YOU CAN DELETE THESE LINES IF YOU WANT TO UNINSTALL THIS ###" >> ~/.login.new
    tail -n +2 .login >> ~/.login.new
    # replace new login to .login
    mv ~/.login.new ~/.login
else
    echo "\nThis script could not find a .login/.profile to inject, you'll need to manually install the startup script manually. Ask Andrew for more details.\n"
fi

# change to home directory
echo "Adding in zsh plugins..."
pushd ~
# git clone the lab dotfile repo
git clone https://gitlab.com/DosenbachGreene/dotfiles.git
# update oh-my-zsh
pushd ~/dotfiles
git submodule update --init
popd
# now copy over the appropriate files/plugin folders
cp -r ~/dotfiles/oh-my-zsh ~/.oh-my-zsh
cp ~/dotfiles/zshrc ~/.zshrc
cp ~/dotfiles/startup ~/.startup
# do clean up
rm -rf ~/dotfiles
popd

echo "Install Complete."
