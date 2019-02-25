#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PS1='\[\e]0;\w\a\]\[\e[34m\]\u@\h:[$?] \[\e[33m\]\w\[\e[0m\]\$ '
# Pureline
if [ "$TERM" != "linux" ]; then
    source ~/pureline/pureline ~/.pureline.conf
fi

export EDITOR='/usr/bin/vim'
export PAGER='/usr/bin/less'

# Bind commands
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Aliases
alias myip='hostname -i'
alias exip='curl ipinfo.io/ip'

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

# Copy w/ progress
cp () {
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
