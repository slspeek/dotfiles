set -x GOPATH ~/go
set -x EDITOR vim
set -x PATH $GOPATH/bin ~/tools/bin $PATH

#disable <C-s> in the shell
stty -ixon
setxkbmap -layout us -option ctrl:nocaps
#stty stop undef
