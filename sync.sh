#!/bin/bash
cd "$(dirname "$0")"
git pull
rsync --exclude ".git/" --exclude ".DS_Store" --exclude "sync.sh" --exclude "LICENSE" --exclude "README.md" -av . ~
source ~/.bash_profile