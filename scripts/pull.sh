#!/usr/bin/env bash

cd ~/.dotfiles || exit 1
git pull
stow --dotfiles --adopt -v .
git restore .
