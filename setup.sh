#!/bin/bash

dotfiles=(
  bash
  git
  ranger
  dolphin
  tmux
  vim
  zsh
  i3
  konsole
  xbindkeys
  less
  lazydocker
  lazygit
  hypr
)

for dir in ${dotfiles[*]}; do
    # shellcheck disable=SC2044
    find "$dir" -type f -print0 | while IFS= read -r -d '' path; do
        src=$(pwd)/$path
        dest=~/${path#"$dir/"}
        path_without_filename=$(dirname "$dest")
        mkdir -p "$path_without_filename"
        echo Linking "$src" to "$dest"
        ln -s "$src" "$dest" --force
        ls -la "$dest" --color
    done
done

