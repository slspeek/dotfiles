#!/usr/bin/env bash

stow --dotfiles --adopt -v .
git restore .
