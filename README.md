# Dotfiles

```
sudo apt install --yes git
BACKUP_DIR=~/.dotfiles-$(date +%Y%m%d-%H%M).backup
mkdir -p ~/.local/bin "$BACKUP_DIR"
mv ~/.bashrc ~/.profile "$BACKUP_DIR"
git clone https://github.com/slspeek/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
dot-local/bin/mytools.sh
dot-local/bin/install-jetbrains-nerdfonts.sh
tldr --update
stow -v --dotfiles .
```
