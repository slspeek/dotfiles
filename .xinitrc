xrdb ~/.Xresources

stty -ixon &
setxkbmap -layout us -option ctrl:nocaps &
stty stop undef &

/*exec i3 --force-xinerama*/
exec i3 
/*exec startlxde*/
/*exec gnome-shell*/

