# Andrew's Lab Dotfiles
I made this because I've been looking at the dotfiles of other lab members and 
they are, to put it mildly, a mess. Paths seem to be a mix of software from all 
over the different NIL systems, so it becomes really difficult to figure out what
versions of things folks are using sometimes. Additionally, most of the default
prompts that people tend to not be very descriptive or helpful.

This repo contains a copy of my own dotfiles with paths and settings that I find to be quite useful. It has been slightly modified for general lab use. In addition to setting up correct paths to versions of software you should be using, it also switches your default shell to `zsh` with a bunch of extra plugins. `zsh` + the plugins allow for several useful shell features that can make you more productive with your terminal!

![crappy](imgs/crappy.png "Old Configs")
*Without Andrew's Dotfiles*

![cool](imgs/cool.png "New Configs")
*With Andrew's Dotfiles*

These dotfiles are specifically meant for use with our lab systems only (so `maeve` and `rocinante`; `heisenberg` is currently not supported). When logging into other NIL systems, the scripts do not to activate, allowing you to continue to use older lab dotfile configurations without issue.

## Installation

Simply run the line below:

```
sh -c "$(curl -fsSL https://gitlab.com/DosenbachGreene/dotfiles/-/raw/master/install.sh)"
```

This will inject the startup script into the appropriate dotfiles based on your current active shell.

Follow and answer any dialog questions that appear.

## Uninstallation

Don't want this anymore? Run this:

```
sh -c "$(curl -fsSL https://gitlab.com/DosenbachGreene/dotfiles/-/raw/master/uninstall.sh)"
```

This will return backed up configs to their original state and remove any installed files.

## Features

- Paths to common lab software at appropriate paths
- Clear location to add custom paths variables; Simply use the `~/.paths_user` file and script away!
- Default shell changed to zsh, with the [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) plugin manager installed.
- Terminal Theming (Default is set to [powerlevel10k](https://github.com/romkatv/powerlevel10k))
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) and [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) installed by default.
