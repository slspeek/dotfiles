# Dotfiles

## Installation

For the next commands to work your user needs sudo rights:
```
su -c sh -c "echo $USER ALL=\(ALL:ALL\) ALL > /etc/sudoers.d/$USER &&
  chmod 0440 /etc/sudoers.d/$USER"
```
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
