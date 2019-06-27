#!/bin/zsh

mkdir ~/bin
mkdir -p ~/.confg/i3

stow -t $HOME git
stow -t $HOME vim
stow -t $HOME tmux
stow -t $HOME zsh
stow -t "$HOME/bin" bin
stow -t "$HOMW/.config/i3" i3

ln -f -s "${0:a:h}/.tool-versions" $HOME
