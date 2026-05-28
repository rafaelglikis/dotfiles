export ZSH="/home/rafael/.oh-my-zsh"
source ~/.profile
ZSH_THEME="amuse"
export DISABLE_AUTO_TITLE='true'
export UPDATE_ZSH_DAYS=13
eval $(thefuck --alias)
plugins=(
  git
  jira
  zsh-syntax-highlighting
  autojump
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

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

[[ -s /home/rafael/.autojump/etc/profile.d/autojump.sh ]] && source /home/rafael/.autojump/etc/profile.d/autojump.sh

source $ZSH/oh-my-zsh.sh
bindkey '^`' autosuggest-clear
bindkey '^ ' autosuggest-execute

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

export TERM=xterm-256color

setopt HIST_IGNORE_SPACE


DOCKER_LW_ENV=$HOME/dev/lw/devsetup/
alias lwdc="docker compose \
    -f ${DOCKER_LW_ENV}docker-compose.yml \
    -f ${DOCKER_LW_ENV}docker-compose.override.yml \
    -f ${DOCKER_LW_ENV}extra/marketplace.yml \
    -f ${DOCKER_LW_ENV}extra/account.yml \
    -f ${DOCKER_LW_ENV}extra/adminer.yml \
    -f ${DOCKER_LW_ENV}extra/pubsub-emulator.yml \
    -f ${DOCKER_LW_ENV}extra/cloner.yml \
    -f ${DOCKER_LW_ENV}extra/cameraman.yml"
alias lwmp="lwdc exec marketplace apprun"
alias lwapi="lwdc exec api apprun"
alias lwclient="lwdc exec client apprun"
alias lwaccount="lwdc exec account apprun"
autoload -U bashcompinit
bashcompinit

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Aliases
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgi='kubectl get ingress'
alias kdp='kubectl describe pod'
alias kdi='kubectl describe ingress'
alias kns='kubens'
alias kctx='kubectx'
alias tetris=tint
if command -v batcat &> /dev/null; then
    alias cat="batcat -p"
    alias bat="batcat"
fi
if command -v gemini &> /dev/null; then 
    alias ai-summarize='gemini -p "Summarize this meeting. Give me a summary section, action items section and a tldr section. No yapping." | tee summary.md'
fi
alias r='ranger'
alias du="du -hsc"
alias whatsmyip="dig -4 +short myip.opendns.com @resolver1.opendns.com"
alias whatsmyip2="curl -4 -s https://ifconfig.co"
alias whatsmyip3='curl ipinfo.io/ip'
alias timestamp='date +%s'
alias copy='xclip -sel clip'
alias copy-branch="git branch --show-current | xclip -sel clip"
alias cb="git branch --show-current | xclip -sel clip"
alias vf='vim `fzf`'
alias ]]='ai chat --system=cli'
alias ]='ai chat --system=cli -c'


r-codex() {
  CODEX_HOME=~/.r-codex command codex "$@"
}

## functions
function kwide {
	kubectl $@ -o wide
}

function ktail {
	kubectl logs --prefix -f -l app=$1
}

forever() {
    while true; do $@; sleep 1; done
}

remove_colors() {
  sed -r "s/\x1B\[[0-9;]*[mK]//g"
}

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

if [ -d /usr/share/doc/fzf/examples/key-bindings.zsh ] ; then
    source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export BUN_INSTALL="$HOME/.bun"

path_prepend_dirs=(
    "$HOME/bin"
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
    "$HOME/go/bin"
    "$HOME/.symfony5/bin"
    "$HOME/learnworlds/.uv/bin"
    "$BUN_INSTALL/bin"
    "$HOME/.opencode/bin"
    "$HOME/.lmstudio/bin"
    "/usr/local/go/bin"
)

for path_dir in "${path_prepend_dirs[@]}"; do
    if [ -d "$path_dir" ] ; then
        PATH="$path_dir:$PATH"
    fi
done
export PATH
unset path_dir path_prepend_dirs

[ -f ~/.zsh_completion ] && source ~/.zsh_completion
alias lzd='lazydocker'

[ -f ~/.claude/local/claude ] && alias claude="~/.claude/local/claude"

# bun completions
[ -s "/home/rafael/.bun/_bun" ] && source "/home/rafael/.bun/_bun"

eval "$(direnv hook zsh)"

<<<<<<< HEAD
# added by learnworlds onboard
eval "$(/home/rafael/.local/bin/mise activate zsh)"
=======
eval "$(mise activate zsh)"
>>>>>>> 958fc4e6a8fa61846b5c6d2730c788b9586ea218
