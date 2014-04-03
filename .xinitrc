xrdb ~/.Xresources

stty -ixon &
setxkbmap -layout us -option ctrl:nocaps &
stty stop undef &
(cd ~/dotfiles/apod/ && sh apod.sh) &

exec i3 --force-xinerama 

