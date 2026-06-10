#!/usr/bin/env bash

set -e

github_user=slspeek
declare -a repos=(fai fai-cmds kookboek debian)

function clone_repo() {
    local repo=$1
    git clone "git@github.com:$github_user/$repo"
}

project_dir=~/proj

mkdir -p $project_dir
cd $project_dir

for repo in "${repos[@]}"; do
    clone_repo "$repo"
done
