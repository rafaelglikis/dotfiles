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
  code
  xbindkeys
  less
  lazydocker
  lazygit
  hypr
  claude
  assets
  alacritty
  opencode
)

for dir in ${dotfiles[*]}; do
    # shellcheck disable=SC2044
    find "$dir" \( -type f -o -type l \) -print0 | while IFS= read -r -d '' path; do
        src=$(pwd)/$path
        dest=~/${path#"$dir/"}
        path_without_filename=$(dirname "$dest")
        mkdir -p "$path_without_filename"
        if [ -L "$src" ]; then
            if resolved=$(readlink -f "$src" 2>/dev/null); then
                src="$resolved"
            else
                target=$(readlink "$src")
                if [[ "$target" != /* ]]; then
                    link_dir=$(dirname "$src")
                    while [ "$link_dir" != "/" ]; do
                        candidate="$link_dir/$target"
                        if [ -e "$candidate" ]; then
                            src=$(readlink -f "$candidate")
                            break
                        fi
                        link_dir=$(dirname "$link_dir")
                    done
                fi
                if [ ! -e "$src" ]; then
                    src=$(readlink -m "$src")
                fi
            fi
        fi
        echo Linking "$src" to "$dest"
        ln -s "$src" "$dest" --force
        ls -la "$dest" --color
    done
done

