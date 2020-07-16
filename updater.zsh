# This file should be sourced automatically by the zshrc
# IT IS NOT INTENDED TO BE RUN MANUALLY
# This should be called after the .paths_user has been sourced

# Cancel update if:
# - the automatic update is disabled.
# - the current user doesn't have write permissions nor owns the $DOTFILES directory.
# - git is unavailable on the system.
if [[ "$DISABLE_DOTFILES_AUTO_UPDATE" = true  ]] \
    || [[ ! -w "${HOME}/.dotfiles" || ! -O "${HOME}/.dotfiles"  ]] \
        || ! command -v git &>/dev/null; then
            return
fi

function current_epoch() {
    zmodload zsh/datetime
    echo $(( EPOCHSECONDS / 60 / 60 / 24  ))        
}

function update_last_updated_file() {
    mkdir -p ${HOME}/.cache
    echo "LAST_EPOCH=$(current_epoch)" >! "${HOME}/.cache/dotfiles-update"    
}

() {
    emulate -L zsh

    local epoch_target LAST_EPOCH

    # Create or update dotfiles-update file if missing or malformed
    if ! source "${HOME}/.cache/dotfiles-update" 2>/dev/null || [[ -z "$LAST_EPOCH"  ]]; then
        update_last_updated_file
        return
    fi

    # Number of days before trying to update again
    epoch_target=${UPDATE_DOTFILES_DAYS:-13}
    # Test if enough time has passed until the next update
        if (( ( $(current_epoch) - $LAST_EPOCH  ) < $epoch_target )); then
        return
    fi

    # check the dotfiles repo and offer update
    echo "Checking for dotfile updates..."
    pushd ${HOME}/.dotfiles > /dev/null
    git fetch
    if [[ "$(git rev-parse HEAD)" != "$(git rev-parse @{u})" ]]; then
        git reset --hard && git pull
        echo ""
        echo "Executing Update..."
        yes | ./install.sh
        echo ""
        echo "Update Complete!"
        echo ""
        echo "Update Note: This updater does not currently auto-update your .zshrc and .paths_user files if they"
        echo "already exist in your home directory. You may want to check the differences between the"
        echo "versions by using 'diff .zshrc ~/.dotfiles/zshrc' and 'diff .paths_user ~/.dotfiles/paths_user'"
        echo "and change your files accordingly. Another update will fix this issue in the near-future."
        echo ""
        echo "If you do not know what any of the above means, you can safely ignore the above message."
    else
        echo "No updates found."
    fi
    popd > /dev/null

    # update the update file
    update_last_updated_file
}
