source ~/.bashrc

# MacPorts Installer addition on 2013-07-18_at_10:37:28: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export CLICOLOR=1
# Finish

# docker for main street development
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/kgh/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

# stash
count_git_stash() {
		git stash list 2> /dev/null | wc -l | sed 's/^ *//g'
}
render_git_stash() {
		if [[ $(count_git_stash) ]]; then 
					echo " Stashed: $(count_git_stash)"
		fi
}

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Adding colors to prompt
#export PS1="\[${BOLD}${MAGENTA}\]\u\[$WHITE\]@\[$ORANGE\]\h\[$WHITE\]: [\[$GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" - \")\[$PURPLE\]\$(parse_git_branch)\[$WHITE\]] \$ \[$RESET\]"

# git branch on command prompt
if [[ ${EUID} == 0 ]] ; then
	  PS1='\[\033\[\033[00;33m\]\w\[\033[00;36m\]$(parse_git_branch)\[\033[01;34m\] \$ \[\033[00m\]'
else
		PS1='\[\033\[\033[00;33m\]\w\[\033[00;36m\]$(parse_git_branch)\[\033[00m\] \$ '
fi
				 
# Change the window title of X terminals
				 PROMPT_COMMAND='echo -ne "\033]0;${PWD/$HOME/~}:$(parse_git_branch)\007"'

# Always enable GREP colors
export GREP_OPTIONS='--color=auto'

# Separate aliases file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi 

# Separate functions file
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

export PATH=/bin/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$PATH
#export EDITOR='subl -w'

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# Searching
alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string


#   cpuHogs:  Find CPU hogs
#   -----------------------------------------------------
    alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'
		

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias be='bundle exec'

source ~/.bash/git_completion.sh

