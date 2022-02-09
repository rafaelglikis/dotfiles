#!/bin/bash

dotfiles=(
  bash
  git
  ranger
  ssh
  tmux
  vim
  zsh
)

for dir in ${dotfiles[*]}; do
    for path in $(find "$dir" -type f); do
        src=$(pwd)/$path
        dest=~/${path#"$dir/"}
        path_without_filename=$(dirname "$dest")
        mkdir -p "$path_without_filename"
        echo Linking "$src" to "$dest"
        ln -s "$src" "$dest" --force
    done
done

