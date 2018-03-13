#!/bin/zsh

stow -t $HOME git
stow -t $HOME vim
stow -t $HOME tmux
stow -t $HOME zsh
stow -t "$HOME/bin" bin

ln -f -s '.tool-versions' $HOME
