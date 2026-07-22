#!/usr/bin/env bash

set -euo pipefail

repo_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)

dotfiles=(
  cli
  kde
  code
  xbindkeys
  assets
)

resolve_source() {
    local src=$1
    local resolved target link_dir candidate

    if [[ ! -L "$src" ]]; then
        printf '%s\n' "$src"
        return
    fi

    if resolved=$(readlink -f "$src" 2>/dev/null); then
        printf '%s\n' "$resolved"
        return
    fi

    target=$(readlink "$src")
    if [[ "$target" != /* ]]; then
        link_dir=$(dirname "$src")
        while [[ "$link_dir" != "/" ]]; do
            candidate="$link_dir/$target"
            if [[ -e "$candidate" ]]; then
                readlink -f "$candidate"
                return
            fi
            link_dir=$(dirname "$link_dir")
        done
    fi

    readlink -m "$src"
}

link_file() {
    local src=$1
    local dest=$2

    src=$(resolve_source "$src")
    mkdir -p "$(dirname "$dest")"

    echo "Linking $src to $dest"
    ln -sfn "$src" "$dest"
    ls -la --color=auto "$dest"
}

link_tree() {
    local src_root=$1
    local dest_root=$2
    local path rel_path

    [[ -d "$src_root" ]] || return

    while IFS= read -r -d '' path; do
        rel_path=${path#"$src_root/"}
        link_file "$path" "$dest_root/$rel_path"
    done < <(find "$src_root" \( -type f -o -type l \) -print0)
}

link_root() {
    local dir=$1

    link_tree "$repo_root/$dir" "$HOME"
}

for dir in "${dotfiles[@]}"; do
    link_root "$dir"
done
