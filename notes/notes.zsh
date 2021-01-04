# This file should be sourced automatically by the zshrc
# IT IS NOT INTENDED TO BE RUN MANUALLY
# This should be called after the .paths_user has been sourced

echo "Update Note: This updater does not currently auto-update your .zshrc and .paths_user files if they"
echo "already exist in your home directory. You may want to check the differences between the"
echo "versions by using 'diff .zshrc ~/.dotfiles/zshrc' and 'diff .paths_user ~/.dotfiles/paths_user'"
echo "and change your files accordingly."
echo ""
echo "On NIL computers, \$REFDIR has been reassigned to /opt/4dfp_tools/refdir for better performance."
echo "If you have hardcoded the original GMT/refdir directory into your code, you should update your"
echo "scripts to use /opt/4dfp_tools/refdir instead."
echo ""
echo "If you do not know what any of the above means, you can safely ignore the above message."

