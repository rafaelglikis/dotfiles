#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f /etc/bash_completion.d/git-prompt ]; then
	source /etc/bash_completion.d/git-prompt
fi

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[\033[01;33m\]$(__git_ps1)\[\033[00m\]$ "

export EDITOR='/usr/bin/vim'
export PAGER='/usr/bin/less'

# Bind commands
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Aliases
alias du="du -hsc";
alias whatsmyip="dig -4 +short myip.opendns.com @resolver1.opendns.com";
alias whatsmyip2="curl -4 -s https://ifconfig.co";
alias whatsmyip3='curl ipinfo.io/ip'
alias cat="batcat -p"
alias bat=batcat
alias r='ranger'
alias copy='xclip -sel clip'
alias copy-branch="git branch --show-current | xclip -sel clip"
alias vf='vim `fzf`'

if [ -x /usr/bin/dircolors ]; then
    test -r $HOME/.dircolors && eval "$(dircolors -b $HOME/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias l='ls -lh --color=auto'
    alias ll='ls -lh --color=auto'
    alias la='ls -lah --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias psgrep='ps aux |grep -v grep |grep -i'
fi

remove_colors() {
  sed -r "s/\x1B\[[0-9;]*[mK]//g"
}

# Copy w/ progress
cpp () {
  rsync -ah --progress $1 $2
}

# Extract everything with extract
function extract {
	if [ -z "$1" ]; then
    	# display usage if no parameters given
    	echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    	echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    	return 1
 	else
    	for n in $@
    	do
      		if [ -f "$n" ] ; then
          		case "${n%,}" in
            		*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) tar xvf "$n" ;;
            		*.lzma)
						unlzma ./"$n"
						;;
            		*.bz2)
						bunzip2 ./"$n"
						;;
            		*.rar)
						unrar x -ad ./"$n"
						;;
            		*.gz)
						gunzip ./"$n"
						;;
            		*.zip)
						unzip ./"$n"
						;;
	            	*.z)
						uncompress ./"$n"
						;;
            		*.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                		7z x ./"$n"
						;;
	            	*.xz)
						unxz ./"$n"
						;;
            		*.exe)
						cabextract ./"$n"
						;;
            		*)
                		echo "extract: '$n' - unknown archive method"
                		return 1
                		;;
          		esac
      		else
          		echo "'$n' - file does not exist"
          		return 1
      		fi
    	done
	fi
}

# run {times} {command}
function run() {
    number=$1
    shift
    for n in $(seq $number); do
        $@
        sleep 1
    done
}

#run forever
forever() {
    while true; do $@; sleep 1; done
}

phpserver() {
    local ip=localhost
    local port="${1:-8000}"
    php -S "${ip}:${port}"
}

pythonserver() {
	local port="${1:-8000}"
    python3 -m http.server $port
}

weather() {
    curl -s "https://wttr.in/${1:-Ponorogo}?m2" | sed -n "1,27p"
}

[[ -s /home/rafael/.autojump/etc/profile.d/autojump.sh ]] && source /home/rafael/.autojump/etc/profile.d/autojump.sh

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

. ~/.bash_completion

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias k='kubectl'
alias kgp='kubectl get pods'
alias kgi='kubectl get ingress'
alias kdp='kubectl describe pod'
alias kdi='kubectl describe ingress'
alias kns='kubens'
alias kctx='kubectx'
alias timestamp='date +%s'

## functions
function kwide {
    kubectl $@ -o wide
}

function ktail {
    kubectl logs --prefix -f -l app=$1
}

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

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

if [ -f "HOME/.cargo/env" ] ; then
    source "$HOME/.cargo/env"
fi
