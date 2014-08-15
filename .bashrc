#disable <C-s> in the shell
stty -ixon
umask u=rwx,g=rwx,o=rx

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"


function tarc() {
	tar cvzf $1.tar.gz $1;
}

function tart() {
	tar tvzf $1;
}

function tarx() {
	tar xvzf $1;
}


# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
PS1_BASE='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]'
PROMPT_COMMAND='if [ $? -eq 0 ]; then PS1=$PS1_BASE\\$; else PS1=$PS1_BASE\\[\\033[01\;31m\\]\(\$?\)\*\\[\\033[00m\\]; fi; history -a'
#export GOROOT=$HOME/tools/go
export GOPATH=$HOME/projs/nog
export PATH=$HOME/.cabal/bin:$HOME/bin:$HOME/haskell_tools/bin:$HOME/tools/bin:$GOROOT/bin:$PATH
HISTSIZE=100000
setxkbmap -layout us -option ctrl:nocaps
#stty stop undef
