# Andrew's Lab Dotfiles
I made this because I've been looking at the dotfiles of other lab members and they are, to put it mildly,
a mess. Paths seem to be a mix of software from all over the different NIL systems, so it becomes really
difficult to figure out what versions of things folks are using sometimes.

This repo contains a copy of my dotfiles with modifications for general lab use. In addition to setting up correct paths to versions of software you should be using, it also switches your default shell to `zsh`. `zsh` allows for quite a few useful shell features that can make you more productive with your terminal!

These dotfiles are specifically meant for use with our lab systems only (so `maeve` and `rocinante`; `heisenberg` is currently not supported). When logging into other NIL systems, the scripts do not to activate allowing you to continue to use older lab dotfile configurations.

## Installation

Simply run the line below:

```
sh -c "$(curl -fsSL https://gitlab.com/DosenbachGreene/dotfiles/-/raw/master/install.sh)"
```

Then follow and answer the dialog questions that appear.

## Uninstallation

Don't want this anymore? Run this:

```
sh -c "$(curl -fsSL https://gitlab.com/DosenbachGreene/dotfiles/-/raw/master/uninstall.sh)"
```

This will return backed up configs to their original state and remove any installed dot file configs.

## Some Features

- Will do a write up in the near-future...
