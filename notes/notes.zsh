# List announcements for users here

echo "$fg[cyan]Update Notes:"
echo "$fg[cyan]This updater does not currently auto-update your .zshrc and .paths_user files if they"
echo "$fg[cyan]already exist in your home directory. You may want to check the differences between the"
echo "$fg[cyan]versions by using 'diff .zshrc ~/.dotfiles/zshrc' and 'diff .paths_user ~/.dotfiles/paths_user'"
echo "$fg[cyan]and change your files accordingly."
echo ""
echo "$fg[cyan]On NIL computers, \$REFDIR has been reassigned to /opt/4dfp_tools/refdir for better performance."
echo "$fg[cyan]If you have hardcoded the original GMT/refdir directory into your code, you should update your"
echo "$fg[cyan]scripts to use /opt/4dfp_tools/refdir instead."
echo ""
echo "$fg[cyan]If you do not know what any of the above means, you can safely ignore the above message."
