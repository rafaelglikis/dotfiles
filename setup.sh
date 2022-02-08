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
    for path in $(find $dir -type f); do
        src=$(pwd)/$path
        dest=~/${path#"$dir/"}
        echo Linking $src to $dest
        ln -s $src $dest --force
    done
done

