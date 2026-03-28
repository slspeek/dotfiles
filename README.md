# Dotfiles

## Installation

Please backup your own configuration files first. These commands **will** overwrite them.

```
sudo apt install --yes git
mkdir -p ~/.local/bin
git clone https://github.com/slspeek/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
scripts/mytools.sh
scripts/install-jetbrains-nerdfonts.sh
tldr --update
stow -v --dotfiles --adopt .
git restore .
```
