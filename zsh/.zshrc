export ZSH="/home/rafael/.oh-my-zsh"

ZSH_THEME="robbyrussell"

export UPDATE_ZSH_DAYS=13

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
  catimg
  npm
  pip 
  python 
  colorize
  command-not-found
  cp
  rsync
  web-search
  composer
  copydir
  copyfile
  docker
  docker-compose
  emoji
  golang
  history
  nmap
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

# Aliases
alias cat="batcat -p"
alias bat="batcat"
alias r='ranger'

DOCKER_LW_ENV=$HOME/lw/devsetup/
alias lwdc="docker-compose -f ${DOCKER_LW_ENV}docker-compose.yml -f ${DOCKER_LW_ENV}docker-compose.override.yml -f ${DOCKER_LW_ENV}extra/account.yml -f ${DOCKER_LW_ENV}extra/adminer.yml"

autoload -U bashcompinit
bashcompinit
eval "$(register-python-argcomplete3 lw)"
