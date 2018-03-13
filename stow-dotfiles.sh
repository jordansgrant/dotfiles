#!/bin/zsh

stow -t $HOME git
stow -t $HOME vim
stow -t $HOME tmux
stow -t $HOME zsh
stow -t "$HOME/bin" bin

ln -f -s "${0:a:h}/.tool-versions" $HOME
