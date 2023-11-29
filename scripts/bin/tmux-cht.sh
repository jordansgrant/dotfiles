#!/bin/bash

selected=$(cat ~/.tmux-cht-languages ~/.tmux-cht-utils | fzf)
if [[ -z $selected ]]; then
  exit 0
fi

read -p "Entry query: " query

if echo "$languages" | grep -qs "$selected"; then
  CHT_PATH="$selected/$(echo "$query" | tr ' ' '+')"
else
  CHT_PATH="$selected~$query"
fi

tmux neww bash -c "curl -s cht.sh/$CHT_PATH | less -r"
