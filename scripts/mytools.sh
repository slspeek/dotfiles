#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install --yes \
  bat \
  curl \
  fd-find \
  fzf \
  just \
  lazygit \
  lsd \
  neovim \
  ripgrep \
  shfmt \
  starship \
  stow \
  tealdeer \
  tmux \
  trash-cli \
  zoxide \
  zsh

curl -LsSf https://astral.sh/uv/install.sh | sh
