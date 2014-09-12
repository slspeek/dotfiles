#!/bin/bash
BACKUP=~/dotfiles.$(date +"%Y%m%d.%H.%M.%S").backup

cd ~
mkdir -vp $BACKUP
mv -v .ctags .i3 .i3status.conf .xinitrc .Xresources .vimrc .vim .tmux.conf .bashrc ~/.config/fish $BACKUP
DOTFILES=.local/dotfiles
ln -s $DOTFILES/.vimrc 
ln -s $DOTFILES/.vim 
ln -s $DOTFILES/.tmux.conf
ln -s $DOTFILES/.bashrc
ln -s $DOTFILES/.Xresources
ln -s $DOTFILES/.xinitrc
ln -s $DOTFILES/.i3
ln -s $DOTFILES/.i3status.conf
ln -s $DOTFILES/.ctags
cd ~/.config/
ln -s ../$DOTFILES/fish


cd ~/$DOTFILES
git submodule init
git submodule update

