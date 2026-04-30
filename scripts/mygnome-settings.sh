#!/usr/bin/env bash

set -e

function git_sparse_clone() (
  rurl="$1" localdir="$2" && shift 2

  mkdir -p "$localdir"
  cd "$localdir"

  git init
  git remote add -f origin "$rurl"

  git config core.sparseCheckout true

  # Loops over remaining args
  for i; do
    echo "$i" >> .git/info/sparse-checkout
  done

  git pull origin main
)

TEMP_DIR=$(mktemp -d)
SUB_PATH=files/etc/dconf/db/local.d

git_sparse_clone https://github.com/slspeek/fai \
  "$TEMP_DIR" "$SUB_PATH"

dconf dump / > ~/dconf.dump.backup.$RANDOM

for CONFFILE in $(find "$TEMP_DIR/$SUB_PATH" -type f |
  grep -v 40-gnome-extensions); do
  sed -i -e 's/{%browser%}/firefox.desktop/g' $CONFFILE
  dconf load / < "$CONFFILE"
done
