xrdb ~/.Xresources

stty -ixon &
setxkbmap -layout us -option ctrl:nocaps &
stty stop undef &

exec i3 --force-xinerama
/*exec startlxde*/
/*exec gnome-shell*/

