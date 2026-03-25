#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install --yes \
	bat \
	fd-find \
	fzf \
	lazygit \
	lsd \
	neovim \
	ripgrep \
	starship \
	stow \
	tealdeer \
	trash-cli \
	zoxide \
	zsh \

curl -LsSf https://astral.sh/uv/install.sh | sh
