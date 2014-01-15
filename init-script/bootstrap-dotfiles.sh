#!/bin/bash
BACKUP=~/dotfiles.backup

cd ~
mkdir -vp $BACKUP
mv -v .Xresources .vimrc .vim .tmux.conf .bashrc ~/.config/fish $BACKUP
ln -s $HOME/dotfiles/.vimrc 
ln -s $HOME/dotfiles/.vim 
ln -s $HOME/dotfiles/.tmux.conf
ln -s $HOME/dotfiles/.bashrc
ln -s $HOME/dotfiles/.Xresources
cd ~/.config/
ln -s $HOME/dotfiles/fish

cd ~/dotfiles
git submodule init
git submodule update

