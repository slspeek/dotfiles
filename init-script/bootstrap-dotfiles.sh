BACKUP=~/dotfiles.backup

cd ~
mkdir -vp $BACKUP
mv -v .vimrc .vim .tmux.conf .bashrc $BACKUP
ln -s $HOME/dotfiles/.vimrc 
ln -s $HOME/dotfiles/.vim 
ln -s $HOME/dotfiles/.tmux.conf
ln -s $HOME/dotfiles/.bashrc

