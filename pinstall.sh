#!/bin/bash

cat $1 |xargs -n 1 pacman --needed --noconfirm -S
