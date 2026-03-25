#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install --yes \
	bat \
	fd-find \
	fzf \
	lazygit \
	lsd \
	neovim \
	starship \
	stow \
	zoxide \
	zsh \

curl -LsSf https://astral.sh/uv/install.sh | sh
