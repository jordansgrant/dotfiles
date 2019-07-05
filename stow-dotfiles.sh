#!/bin/zsh

mkdir -p $HOME/bin
mkdir -p $HOME/.confg/i3
mkdir -p $HOME/.confg/nvim

stow -t $HOME git
stow -t $HOME vim
stow -t "$HOME/.config/nvim" nvim
stow -t $HOME tmux
stow -t $HOME zsh
stow -t $HOME xorg
stow -t "$HOME/bin" bin
stow -t "$HOME/.config/i3" i3

ln -f -s "${0:a:h}/.tool-versions" $HOME
