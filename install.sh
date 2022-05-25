#!/bin/bash
# query user input for install
echo ""
echo "######################################################"
echo ""
echo "          _---~~(~~-_."
echo "        _{        )   )"
echo "      ,   ) -~~- ( ,-' )_         Andrew's"
echo "     (  \`-,_..\`., )-- '_,)        Dotfiles"
echo "    ( \` _)  (  -~( -_ \`,  }"
echo "    (_-  _  ~_-~~~~\`,  ,' )"
echo "      \`~ -^(    __;-,((()))"
echo "            ~~~~ {_ -_(())"
echo ""
echo "This will setup Andrew's personal dotfile configuration."
echo "Make sure the shell is set to zsh."
echo "######################################################"
echo ""
read -p "Continue? [y/N]: " vcontinue
if [[ $vcontinue == "Y" ]]; then
  vcontinue="y"
fi
[[ $vcontinue != "y" ]] && echo "Quitting... Not installed." && exit 0
echo ""

# Get the current shell type
export CURRENTSHELL=$(basename ${SHELL})

if [[ ${CURRENTSHELL} == "zsh" || ${CURRENTSHELL} == "zsh" ]]; then
  echo "Current shell is zsh. This is the correct shell"
else # Other shells
  echo "Non-zsh shell detected. Exiting..."
  exit 1
fi

# change to home directory
echo "Adding in zsh plugins..."
pushd ~ > /dev/null
# git clone the lab dotfile repo if not exist; otherwise just pull
if [ -d ~/.dotfiles ]; then
  pushd ~/.dotfiles > /dev/null
  git pull
  popd > /dev/null
else
  git clone https://gitlab.com/DosenbachGreene/dotfiles.git ~/.dotfiles
fi
# clone oh-my-zsh
[ ! -d ~/.oh-my-zsh ] && git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
# clone theme3
pushd ~/.oh-my-zsh/custom/themes > /dev/null
[ ! -d powerlevel10k ] && git clone https://github.com/romkatv/powerlevel10k.git
cd powerlevel10k
git reset --hard && git checkout master && git pull && git checkout v1.16.0 && cd ..
popd > /dev/null
# clone plugins
pushd ~/.oh-my-zsh/custom/plugins > /dev/null
[ ! -d zsh-autosuggestions ] && git clone https://github.com/zsh-users/zsh-autosuggestions.git
cd zsh-autosuggestions
git reset --hard && git checkout master && git pull && git checkout v0.7.0 && cd ..
[ ! -d zsh-syntax-highlighting ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
cd zsh-syntax-highlighting
git reset --hard && git checkout master && git pull && git checkout 0.7.1 && cd ..
popd > /dev/null
# the current zshrc in home if not exist
[ ! -f ~/.zshrc ] && cp ~/.dotfiles/zshrc ~/.zshrc
# add paths_user file if not exist
[ ! -f ~/.paths_user ] && cp ~/.dotfiles/paths_user ~/.paths_user
popd > /dev/null

echo ""
echo "######################################################"
echo "Install Complete."
echo "Logout then login to see the new changes."
echo "######################################################"
echo ""
