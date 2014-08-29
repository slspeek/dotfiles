set -x GOPATH ~/go
set -x EDITOR vim
set -x PATH $GOROOT/bin $GOPATH/bin ~/tools/bin $PATH /usr/local/bin

alias vi=vim
#disable <C-s> in the shell
stty -ixon
setxkbmap -layout us -option ctrl:nocaps
#stty stop undef
