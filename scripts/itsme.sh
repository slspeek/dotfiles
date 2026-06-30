#!/usr/bin/env bash

repo_path=$(realpath "$(dirname "$0")/..")

function change_remote_origin() {
    cd "$repo_path" || exit
    git remote set-url origin git@github.com:slspeek/dotfiles
}

function link_gitconfig() {
    ln -s "$repo_path"/dot-gitconfig ~/.gitconfig
}

change_remote_origin
link_gitconfig
