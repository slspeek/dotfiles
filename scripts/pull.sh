#!/usr/bin/env bash

git pull
stow --dotfiles --adopt -v .
git restore
