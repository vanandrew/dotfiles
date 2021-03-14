#!/bin/bash
# This file is setup to modify the .login or .bash_profile
# file in the user's home directory
#
# It backs up the previous .login file as
# .login.bak and .bash_profile as .bash_profile.bak

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
echo "This will setup Andrew's lab dotfile configuration."
echo "This installer should be run ONLY on maeve or rocinante."
echo "No other systems are currently supported."
echo "######################################################"
echo ""
read -p "Continue? [y/N]: " vcontinue
if [[ $vcontinue == "Y" ]]; then
  vcontinue="y"
fi
[[ $vcontinue != "y" ]] && echo "Quitting... Not installed." && exit 0
echo ""

# Get the current shell type
export CURRENTSHELL=${SHELL}

# define csh .login modifier function
csh_login_install() {
  echo "Making new .login file..."
  echo "#!/bin/csh" > ~/.login.new
  echo "#%^%^%^%" >> ~/.login.new
  echo "source ~/.dotfiles/startup.csh" >> ~/.login.new
  cat ~/.login >> ~/.login.new
  # replace new login to .login
  mv ~/.login.new ~/.login
}

# define .cshrc modifier function
cshrc_install() {
  echo "Making new .cshrc file..."
  echo "#!/bin/csh" > ~/.cshrc.new
  echo "#%^%^%^%" >> ~/.cshrc.new
  echo "if(\$?prompt) then" >> ~/.cshrc.new
  echo "  source ~/.dotfiles/startup.csh" >> ~/.cshrc.new
  echo "endif" >> ~/.cshrc.new
  cat ~/.cshrc >> ~/.cshrc.new
  # replace new cshrc to .cshrc
  mv ~/.cshrc.new ~/.cshrc
}

# define bash profile modifier function
bash_profile_install() {
  echo "Making new .bash_profile file..."
  echo "#!/bin/bash" > ~/.bash_profile.new
  echo "#%^%^%^%" >> ~/.bash_profile.new
  echo "source ~/.dotfiles/startup.sh" >> ~/.bash_profile.new
  cat ~/.bash_profile >> ~/.bash_profile.new
  # replace new bash_profile to .bash_profile
  mv ~/.bash_profile.new ~/.bash_profile
}

# define .bashrc modifier function
bashrc_install() {
  echo "Making new .bashrc file..."
  echo "#!/bin/bash" > ~/.bashrc.new
  echo "#%^%^%^%" >> ~/.bashrc.new
  echo "[[ \$- == *i* ]] && source ~/.dotfiles/startup.sh" >> ~/.bashrc.new
  cat ~/.bashrc >> ~/.bashrc.new
  # replace new bashrc to .bashrc
  mv ~/.bashrc.new ~/.bashrc
}

# For csh install
if [[ ${CURRENTSHELL} == "/bin/csh" || ${CURRENTSHELL} == "/bin/tcsh" || ${CURRENTSHELL} == "/usr/bin/csh" || ${CURRENTSHELL} == "/usr/bin/tcsh" ]]; then
  # copy the current login file if it exists
  if [ -f ~/.login ]; then
    echo "Detecting existing .login file..."
    # check if the login file has already been modified with a previous install
    if [[ $(grep \#%^%^%^% ~/.login) == "#%^%^%^%" ]]; then
      echo "This .login file has already been modified. Skipping script injection..."
    else
      echo "Backing up old .login file..."
      # make copy of .login for backup
      cp ~/.login ~/.login.bak
      # modify .login
      csh_login_install
    fi
  else # no current .login file exists
    # make a new .login file
    touch ~/.login
    # modify .login
    csh_login_install
  fi
  # copy the current cshrc file if it exists
  if [ -f ~/.cshrc ]; then
    echo "Detecting existing .cshrc file..."
    # check if the cshrc file has already been modified with a previous install
    if [[ $(grep \#%^%^%^% ~/.cshrc) == "#%^%^%^%" ]]; then
      echo "This .cshrc file has already been modified. Skipping script injection..."
    else
      echo "Backing up old .cshrc file..."
      # make copy of .cshrc for backup
      cp ~/.cshrc ~/.cshrc.bak
      # modify .cshrc
      cshrc_install
    fi
  else # no current .cshrc file exists
    # make a new .cshrc file
    touch ~/.cshrc
    # modify .cshrc
    cshrc_install
  fi
elif [[ ${CURRENTSHELL} == "/bin/bash" || ${CURRENTSHELL} == "/bin/sh" || ${CURRENTSHELL} == "/usr/bin/bash" || ${CURRENTSHELL} == "/usr/bin/sh" ]]; then # For Bash
  # copy the current bash_profile if it exists
  if [ -f ~/.bash_profile ]; then
    echo "Detecting existing .bash_profile..."
    # check if the bash_profile has already been modified
    if [[ $(grep \#%^%^%^% ~/.bash_profile) == "#%^%^%^%" ]]; then
      echo "This .bash_profile file has already been modified. Skipping script injection..."
    else
      echo "Backing up old .bash_profile file..."
      # make copy of .login for backup
      cp ~/.bash_profile ~/.bash_profile.bak
      # modify .bash_profile
      bash_profile_install
    fi
  else # no current .bash_profile exists
    # make a new .bash_profile file
    touch ~/.bash_profile
    # modify .bash_profile
    bash_profile_install
  fi
  # copy the current bashrc if it exists
  if [ -f ~/.bashrc ]; then
    echo "Detecting existing .bashrc..."
    # check if the bashrc has already been modified
    if [[ $(grep \#%^%^%^% ~/.bashrc) == "#%^%^%^%" ]]; then
      echo "This .bashrc file has already been modified. Skipping script injection..."
    else
      echo "Backing up old .bashrc file..."
      # make copy of .login for backup
      cp ~/.bashrc ~/.bashrc.bak
      # modify .bashrc
      bashrc_install
    fi
  else # no current .bashrc exists
    # make a new .bashrc file
    touch ~/.bashrc
    # modify .bash_profile
    bashrc_install
  fi
elif [[ ${CURRENTSHELL} == "/bin/zsh" || ${CURRENTSHELL} == "/usr/bin/zsh" ]]; then
  echo "Current shell is zsh. It is assumed that the appropriate login script has been modified."
else # Other shells
  echo "Unknown shell detected. Assuming zsh. If this is not correct be aware that his script may not work..."
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
[ ! -d ~/.oh-my-zsh ] && git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh && chmod -R 755 ~/.oh-my-zsh
# clone theme
pushd ~/.oh-my-zsh/custom/themes > /dev/null
[ ! -d powerlevel10k ] && git clone https://github.com/romkatv/powerlevel10k.git && chmod -R 755 powerlevel10k
cd powerlevel10k
git reset --hard && git fetch && git checkout v1.14.5 && cd .. && chmod -R 755 powerlevel10k
popd > /dev/null
# clone plugins
pushd ~/.oh-my-zsh/custom/plugins > /dev/null
[ ! -d zsh-autosuggestions ] && git clone https://github.com/zsh-users/zsh-autosuggestions.git && chmod -R 755 zsh-autosuggestions
cd zsh-autosuggestions
git reset --hard && git fetch && git checkout v0.6.4 && cd .. && chmod -R 755 zsh-autosuggestions
[ ! -d zsh-syntax-highlighting ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git && chmod -R 755 zsh-syntax-highlighting
cd zsh-syntax-highlighting
git reset --hard && git fetch && git checkout 0.7.1 && cd .. && chmod -R 755 zsh-syntax-highlighting
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
echo ""
echo "If this is the initial install, you will get a series"
echo "of prompts on restart. Simply answer all the questions"
echo "when asked. If you have questions/concerns, see this"
echo "FAQ: https://gitlab.com/DosenbachGreene/dotfiles#faq"
echo "or contact me on Slack --Andrew"
echo "######################################################"
echo ""
