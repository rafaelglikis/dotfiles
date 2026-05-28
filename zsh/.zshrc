export ZSH="/home/rafael/.oh-my-zsh"
export EDITOR='vim'
export TERM=xterm-256color
export DISABLE_AUTO_TITLE='true'
export UPDATE_ZSH_DAYS=13
source ~/.profile
ZSH_THEME="amuse"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  extract
  colored-man-pages
  sudo
  history
  python
  colorize
  cp
  rsync
  docker
  docker-compose
  emoji
  golang
  tmux
)

if command -v thefuck >/dev/null 2>&1; then
  eval "$(thefuck --alias)"
fi

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

if [ -s "$ZSH/oh-my-zsh.sh" ]; then
  source "$ZSH/oh-my-zsh.sh"
fi

if (( $+widgets[autosuggest-clear] )); then
  bindkey '^`' autosuggest-clear
fi

if (( $+widgets[autosuggest-execute] )); then
  bindkey '^ ' autosuggest-execute
fi

setopt HIST_IGNORE_SPACE

autoload -U bashcompinit
bashcompinit

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Aliases
alias lwdc="lw dc"
alias lzd='lazydocker'
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgi='kubectl get ingress'
alias kdp='kubectl describe pod'
alias kdi='kubectl describe ingress'
alias kns='kubens'
alias kctx='kubectx'

if command -v batcat &> /dev/null; then
    alias cat="batcat -p"
    alias bat="batcat"
fi

alias du="du -hsc"
alias myip="dig -4 +short myip.opendns.com @resolver1.opendns.com"
alias timestamp='date +%s'
alias copy='xclip -sel clip'
alias copy-branch="git branch --show-current | xclip -sel clip"
alias cb="git branch --show-current | xclip -sel clip"
alias vf='vim `fzf`'

# functions
function kwide {
	kubectl "$@" -o wide
}

function ktail {
	kubectl logs --prefix -f -l "app=$1"
}

forever() {
    while true; do "$@"; sleep 1; done
}

if [ -r /usr/share/doc/fzf/examples/key-bindings.zsh ] ; then
    source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

path_prepend_dirs=(
    "$HOME/bin"
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
    "$HOME/go/bin"
    "$HOME/.symfony5/bin"
    "$HOME/learnworlds/.uv/bin"
    "$HOME/.bun/bin"
    "$HOME/.opencode/bin"
    "$HOME/.lmstudio/bin"
    "/usr/local/go/bin"
)

typeset -U path PATH
for path_dir in "${path_prepend_dirs[@]}"; do
    if [ -d "$path_dir" ] ; then
        path=("$path_dir" "$path[@]")
    fi
done
export PATH
unset path_dir path_prepend_dirs

[ -f ~/.zsh_completion ] && source ~/.zsh_completion
[ -s "/home/rafael/.bun/_bun" ] && source "/home/rafael/.bun/_bun"

if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi
