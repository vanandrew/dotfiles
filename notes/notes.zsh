# List announcements for users here

echo "%{$fg[orange]%}Update Notes:"
echo "%{$fg[orange]%}This updater does not currently auto-update your .zshrc and .paths_user files if they"
echo "%{$fg[orange]%}already exist in your home directory. You may want to check the differences between the"
echo "%{$fg[orange]%}versions by using 'diff .zshrc ~/.dotfiles/zshrc' and 'diff .paths_user ~/.dotfiles/paths_user'"
echo "%{$fg[orange]%}and change your files accordingly."
echo "%{$fg[orange]%}"
echo "%{$fg[orange]%}On NIL computers, \$REFDIR has been reassigned to /opt/4dfp_tools/refdir for better performance."
echo "%{$fg[orange]%}If you have hardcoded the original GMT/refdir directory into your code, you should update your"
echo "%{$fg[orange]%}scripts to use /opt/4dfp_tools/refdir instead."
echo "%{$fg[orange]%}"
echo "%{$fg[orange]%}If you do not know what any of the above means, you can safely ignore the above message."
