#!/usr/bin/env bash
set -e

[[ $(id -u) -ne 0 ]] && echo "You must be root" && exit 1

USERNAME=$1

echo "$USERNAME ALL=(ALL:ALL) ALL" > /etc/sudoers.d/"$USERNAME" &&
  chmod 0440 /etc/sudoers.d/"$USERNAME"
