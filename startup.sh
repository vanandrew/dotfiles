#!/bin/bash
# This file should be called as the first command of the .bash_profile file
# It can (and should) be installed via the install.sh script

# get system name
export SYSNAME=$(uname -n)

# setup valid systems to run this script on
export VALIDSYSTEMS=($(ls ~/.dotfiles/systems))

# loop through valid systems
for SYSTEM in ${VALIDSYSTEMS[@]}; do
  SYSTEM=${SYSTEM%.*}
  if [[ ${SYSNAME} == ${SYSTEM} ]]; then # activate zsh if a valid system
    export SHELL=/bin/zsh
    /bin/zsh # call zsh
    exec /bin/true # force quit from calling bash for seemless shell change
  fi
done
