set -x LANG nl_NL.UTF-8
set -x GOPATH ~/go
set -x EDITOR vim
set -x PATH $GOROOT/bin $GOPATH/bin ~/tools/bin $PATH /usr/local/bin

alias vi=vim
alias sud='sudo su -'
alias S='sudo pacman -S --needed'
alias Ss='sudo pacman -Ss'

#disable <C-s> in the shell
stty -ixon
setxkbmap -layout us -option ctrl:nocaps

