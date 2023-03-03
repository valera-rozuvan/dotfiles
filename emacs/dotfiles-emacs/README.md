# dotfiles-emacs

Dotfiles for minimal Emacs setup.

## prerequisites

The emacs config specifically mentions the font `IBM Plex Mono 13`. On a Debian based Linux distro the font family can be installed like so:

```shell
sudo apt install fonts-ibm-plex
```

This is the extensive typeface family designed by IBM. See [Package: fonts-ibm-plex](https://packages.debian.org/bullseye/fonts-ibm-plex).

## installing

A handy bash script is provided to automate installation of this Emacs setup. You can run:

```
./install.sh
```

But be aware! It cleans up any previous `.emacs*` stuff you might have.
