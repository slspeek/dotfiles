#!/usr/bin/env bash

REPO_PATH=$(dirname "$(realpath "$0")")/..

function change_remote_origin() {
    cd "$REPO_PATH" || exit
    git remote set-url origin git@github.com/slspeek/dotfiles
}

function link_gitconfig() {
    ln -s ~/"$REPO_PATH"/dot-gitconfig ~/.gitconfig
}

change_remote_origin
link_gitconfig
