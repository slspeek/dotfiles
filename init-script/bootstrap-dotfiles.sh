BACKUP=~/dotfiles.backup

mkdir -p $BACKUP
mv -i .vimrc .vim .tmux.conf .bashrc $BACKUP
cd ~
ln -s $HOME/dotfiles/.vimrc 
ln -s $HOME/dotfiles/.vim 
ln -s $HOME/dotfiles/.tmux.conf
ln -s $HOME/dotfiles/.bashrc

