xrdb ~/.Xresources

stty -ixon &
setxkbmap -layout us -option ctrl:nocaps &
stty stop undef &
~/tools/bin/apod-bg --login &

exec i3 --force-xinerama
#exec gnome-shell

