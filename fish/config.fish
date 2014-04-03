set -x GOROOT ~/tools/go
set -x GOPATH ~/projs/camli
set -x EDITOR vim
set -x PATH $GOROOT/bin $GOPATH/bin ~/tools/bin $PATH

#disable <C-s> in the shell
stty -ixon
setxkbmap -layout us -option ctrl:nocaps
#stty stop undef
