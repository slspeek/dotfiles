# Dotfiles

```
mkdir ~/.local/bin
mv ~/.bashrc ~/.profile ~/dotfiles.backup
git clone https://github.com/slspeek/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow -v --dotfiles .
```
