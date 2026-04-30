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
    shellcheck \
    shfmt \
    starship \
    stow \
    tealdeer \
    tmux \
    trash-cli \
    zoxide \
    zsh

if ! command -v uv; then
    curl -LsSf https://astral.sh/uv/install.sh | sh
fi

if ! command -v cargo; then
    "$(dirname "$(realpath "$0")")"/install-cargo.sh
    # shellcheck disable=SC1091
    source "$HOME/.cargo/env"
fi

if ! command -v zellij; then
    "$(dirname "$(realpath "$0")")"/install-zellij.sh
fi
