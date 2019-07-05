#!/bin/bash

mkdir -p $HOME/bin
mkdir -p $HOME/.config
mkdir -p $HOME/.confg/i3
mkdir -p $HOME/.confg/rat
mkdir -p $HOME/.confg/dunst
mkdir -p $HOME/.confg/nvim

stow -t $HOME git
stow -t $HOME vim
stow -t "$HOME/.config/nvim" nvim
stow -t $HOME tmux
stow -t $HOME zsh
stow -t $HOME xorg
stow -t "$HOME/bin" bin
stow -t "$HOME/.config/i3" i3
stow -t "$HOME/.config/rat" rat
stow -t "$HOME/.config/dunst" dunst

ln -f -s "${0:a:h}/.tool-versions" $HOME
