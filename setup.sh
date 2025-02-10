#!/bin/bash

dotfiles=(
  bash
  git
  ranger
  dolphin
  ssh
  tmux
  vim
  zsh
  i3
  konsole
  xbindkeys
  less
)

for dir in ${dotfiles[*]}; do
    # shellcheck disable=SC2044
    for path in $(find "$dir" -type f); do
        src=$(pwd)/$path
        dest=~/${path#"$dir/"}
        path_without_filename=$(dirname "$dest")
        mkdir -p "$path_without_filename"
        echo Linking "$src" to "$dest"
        ln -s "$src" "$dest" --force
        ls -la "$dest" --color
    done
done

