#!/bin/bash
BACKUP=~/dotfiles.$(date +"%Y%m%d.%H.%M.%S").backup

cd ~
mkdir -vp $BACKUP
mv -v .i3 .i3status.conf .xinitrc .Xresources .vimrc .vim .tmux.conf .bashrc ~/.config/fish $BACKUP
DOTFILES=$HOME/dotfiles
ln -s $DOTFILES/.vimrc 
ln -s $DOTFILES/.vim 
ln -s $DOTFILES/.tmux.conf
ln -s $DOTFILES/.bashrc
ln -s $DOTFILES/.Xresources
ln -s $DOTFILES/.xinitrc
ln -s $DOTFILES/.i3
ln -s $DOTFILES/.i3status.conf
cd ~/.config/
ln -s $DOTFILES/fish


cd ~/dotfiles
git submodule init
git submodule update

