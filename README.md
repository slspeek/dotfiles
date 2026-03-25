# Dotfiles

```
sudo apt install git
mkdir -p ~/.local/bin ~/dotfiles.backup
mv ~/.bashrc ~/.profile ~/dotfiles.backup
git clone https://github.com/slspeek/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
dot-local/bin/mytools.sh
dot-local/bin/install-jetbrains-nerdfonts.sh
stow -v --dotfiles .
```
