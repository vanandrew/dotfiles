# Andrew's Lab Dotfiles
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

## FAQ

### How do I get the fancy icons like in your screenshot?
You'll need patched fonts, which you can grab from [here](https://www.nerdfonts.com/). If you are using `vnc`, patched fonts should already be installed on our servers (Look for `SauceCodePro Nerd Font`). 

### My shell is too slow/unresponsive
This generally occurs if you have stuff on you `PATH` located on a network drive. Some of the plugins do searches on the `PATH`, which can cause a slow down since it'll be searching on a network drive. To avoid this performance hit, it's generally best to keep network paths off your `PATH`.

Alternatively, you can try disabling the `zsh-syntax-highlighting` plugin in the `.zshrc` in your home directory (which seems to be the main culprit in most slow downs). You can do this by deleting the `zsh-syntax-highlighting` entry from the `plugins` array. This will disable syntax coloring, but most likely improve performance dramatically.