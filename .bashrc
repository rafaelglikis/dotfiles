#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PS1='\[\e]0;\w\a\]\[\e[34m\]\u@\h:[$?] \[\e[33m\]\w\[\e[0m\]\$ '

export EDITOR='/usr/bin/vim'
export PAGER=/usr/bin/less

# Bind commands
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind '"\e[A": history-search-backward' 
bind '"\e[B": history-search-forward'

# Commands
if [ -x /usr/bin/dircolors ]; then
    test -r $HOME/.dircolors && eval "$(dircolors -b $HOME/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias l='ls -lh --color=auto'
    alias la='ls -lah --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias psgrep='ps aux |grep -v grep |grep -i'
fi

# Aliases
# ip is a valid linux
alias myip='hostname -i'
alias fileserver='python3 -m http.server'

# Extract everything with extract
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1     ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
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

# Powerline
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  source /usr/share/powerline/bindings/bash/powerline.sh
fi
