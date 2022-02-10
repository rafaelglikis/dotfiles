export ZSH="/home/rafael/.oh-my-zsh"

ZSH_THEME="robbyrussell"

export UPDATE_ZSH_DAYS=13
eval $(thefuck --alias)
plugins=(
  git 
  zsh-syntax-highlighting
  zsh-autopair
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
# Aliases
alias cat="batcat -p"
alias bat="batcat"
alias r='ranger'

DOCKER_LW_ENV=$HOME/lw/devsetup/
alias lwdc="docker-compose -f ${DOCKER_LW_ENV}docker-compose.yml -f ${DOCKER_LW_ENV}docker-compose.override.yml -f ${DOCKER_LW_ENV}extra/account.yml -f ${DOCKER_LW_ENV}extra/adminer.yml"

autoload -U bashcompinit
bashcompinit
eval "$(register-python-argcomplete3 lw)"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
