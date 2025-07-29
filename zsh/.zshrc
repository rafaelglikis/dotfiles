export ZSH="/home/rafael/.oh-my-zsh"
source ~/.profile
ZSH_THEME="robbyrussell"
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
eval "$(zoxide init zsh)"

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

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d /usr/share/doc/fzf/examples/key-bindings.zsh ] ; then
    source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ] ; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/go/bin/" ] ; then
    PATH="$HOME/go/bin/:$PATH"
fi

if [ -d "$HOME/.cargo/bin/" ] ; then
    PATH="$HOME/.cargo/bin/:$PATH"
fi

[ -f ~/.zsh_completion ] && source ~/.zsh_completion
alias lzd='lazydocker'

[ -f ~/.claude/local/claude ] && alias claude="~/.claude/local/claude"