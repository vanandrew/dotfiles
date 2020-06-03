#!/bin/csh
# This file should be called as the first command of the .login file
# It can (and should) be installed via the install.sh script

# get system name
set sysname = `uname -n`

# setup valid systems to run this script on
set validsystems = ("maeve" "rocinante")

# loop through valid systems
foreach system ($validsystems)
  if ($sysname == $system) then # activate zsh if a valid system
    /bin/zsh # call zsh
    exec /bin/true # force quit from calling csh for seemless shell change
  endif
end