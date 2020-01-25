#!/bin/bash

mkdir -p $HOME/bin
mkdir -p $HOME/.config
mkdir -p $HOME/.confg/i3
mkdir -p $HOME/.confg/rat
mkdir -p $HOME/.confg/dunst
mkdir -p $HOME/.confg/nvim
mkdir -p $HOME/.config/systemd/user

stow -t $HOME environment
stow -t $HOME git
stow -t $HOME tmux
stow -t $HOME vim
stow -t $HOME xorg
stow -t $HOME zsh
stow -t "$HOME/bin" bin
stow -t "$HOME/.config/dunst" dunst
stow -t "$HOME/.config/i3" i3
stow -t "$HOME/.config/nvim" nvim
stow -t "$HOME/.config/rat" rat
stow -t "$HOME/.config/systemd" systemd

ln -f -s "${0:a:h}/.tool-versions" $HOME
