# Dotfiles

```
sudo apt install git
mkdir -p ~/.local/bin ~/dotfiles.backup
mv ~/.bashrc ~/.profile ~/dotfiles.backup
git clone https://github.com/slspeek/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
dot-files/bin/mytools.sh
stow -v --dotfiles .
```
