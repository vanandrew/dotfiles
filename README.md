# Andrew's Lab Dotfiles
This repo contains a copy of my own dotfiles with paths and settings that I find to be quite useful. It has been slightly modified for general lab use. In addition to setting up correct paths to versions of software you should be using, it also switches your default shell to `zsh` with a bunch of extra plugins. `zsh` + the plugins allow for several useful shell features that can make you more productive with your terminal!

*Without Andrew's Dotfiles*

![crappy](imgs/crappy.png "Old Configs")

*With Andrew's Dotfiles*

![cool](imgs/cool.png "New Configs")

*Demo*

![demo](imgs/demo.gif "Demo")

These dotfiles are specifically meant for use with our lab systems only (so `maeve` and `rocinante`; `heisenberg` is currently not supported). When logging into other NIL systems, the scripts do not to activate, allowing you to continue to use older lab dotfile configurations without issue.

## Installation on NIL Systems

Simply run the line below on either `maeve` or `rocinante` (NOTE: The installer identifies your current shell using the $SHELL variable. If you've modified it the installer
may not install the correct startup script for your current shell.):

```
# bash
bash -c "$(curl -fsSL https://gitlab.com/DosenbachGreene/dotfiles/-/raw/master/install.sh)"

# csh
pushd ~ && curl -O https://gitlab.com/DosenbachGreene/dotfiles/-/raw/master/install.sh && chmod +x install.sh && ./install.sh && rm install.sh && popd
```

This will inject the startup script into the appropriate dotfiles based on your current active shell.

Follow and answer any dialog questions that appear.

## Installation on other machines

The above procedure will redirect your `bashrc`/`cshrc` profiles to start `zsh` on startup. This adds an extra unneccessary step for starting `zsh`, but is required for NIL systems since a single SHELL profile is shared among multiple machines (and `zsh` may not necessarily be installed). Additionally, extra logic is added so that `zsh` is executed only on specific system names (e.g. `maeve`/`rocinante`). These are fail safes for NIL systems that will likely not apply when installing these dotfiles on other machines.

The workaround for this behavior is to simply change the default shell to `zsh` for your user, before running the install script. This can be done with:

```
# change the default shell to zsh (you will need zsh to be installed with your system package manager)
sudo chsh [your username]

# restart your terminal (so that you are now using zsh by default) then run the install script
bash -c "$(curl -fsSL https://gitlab.com/DosenbachGreene/dotfiles/-/raw/master/install.sh)"

```

Follow the rest of the dialog questions. One thing to note is that this will only setup `zsh` and it's plugins and not any neuroimaging tools (Those will need to be installed separately).

## Uninstallation

Don't want this anymore? Run this:

```
bash -c "$(curl -fsSL https://gitlab.com/DosenbachGreene/dotfiles/-/raw/master/uninstall.sh)"
```

This will return backed up configs to their original state and remove any installed files.

## Features

- Paths to up-to-date common lab software
    - 4dfp (latest)
    - ANTS (latest)
    - FSL (6.0.3)
    - AFNI (20.0.18)
    - Freesurfer (6.0.0)
    - Connectome Workbench (1.4.2)
- Clear location for user config; Simply use the `~/.paths_user` file and script away!
- Default shell changed to zsh, with the [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) plugin manager installed.
- Terminal Theming (Default is set to [powerlevel10k](https://github.com/romkatv/powerlevel10k))
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) and [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) installed by default.
- Auto-updater for keeping all your paths up-to-date with the rest of the lab.

**Software you need not available here? Let me know on Slack!**

## Defining custom environment variables/paths

User specific paths/environment variables can be defined in your `~/.paths_user` file. This file is automatically sourced on startup of `zsh`. The file accepts any valid `zsh` syntax (backwards compatible with `bash`). Some Examples:

```
# In file ~/.paths_user

# Define a custom environment variable
export MY_CUSTOM_VARIABLE="This is a custom variable!"

# Add custom paths to $PATH variable
export path=($path /some/location/to/custom/pkg/)
```

A useful [reference guide for zsh syntax](http://www.bash2zsh.com/zsh_refcard/refcard.pdf).

## FAQ

### When I run `csh`/`bash`, `zsh` is executed instead! How do I get back `csh`/`bash`

These dotfiles work my redirecting the `csh`/`bash` profiles to execute `zsh` instead. You can get around this behavior by executing `csh`/`bash` with the `-f`/`--noprofile --norc` flags respectively (e.g. `csh -f` or `bash --noprofile --norc`).

### What does the install script do to my setup?
The install script identifies your current shell through the `$SHELL` variable to install the appropriate startup file. Currently, the only shells supported are `csh`, `bash` and `zsh`.
A call to the startup file is placed at the very top of your current shell's profile/rc files. This startup file only runs when you are on a supported system (`maeve` and `rocinante` 
at the moment). If you're already on `zsh` all of these steps are skipped.

From there, `zsh` is executed, which calls `~/.zshrc`. Then lab wide software paths are setup (`path_default` file) as well as your own user config file (`~/.paths_user`).

### How do I get the fancy icons like in your screenshot?
You'll need patched fonts, which you can grab from [here](https://www.nerdfonts.com/). If you are using `vnc`, patched fonts should already be installed on our servers (Look for `SauceCodePro Nerd Font`). 

If you are still using the default `powerlevel10k` theme, you'll also need to enable the icons in the configuration (the set of questions asked to you on install, or by typing `p10k configure`)

### I don't see syntax highlighting on my shell!
It is disabled by default for performance reasons (Particularly if you spend most of your time on networked drives).

To enable it, add the `zsh-syntax-highlighting` line to your `plugins` array in
your `~/.zshrc` file.

### What is instant prompt?
It is a feature of the `powerlevel10k` theme. It allows you to start typing commands into your terminal before all the `zsh` plugins finish loading.

If you are using the default configuration, it's recommended that you leave it off. It is only useful if you have a bunch of plugins loaded (see the `plugins` array in `~/.zshrc`)

### How do I change my answers to those startup questions?
The command is `p10k configure` to rerun the [powerlevel10k](https://github.com/romkatv/powerlevel10k) theme startup prompt.
