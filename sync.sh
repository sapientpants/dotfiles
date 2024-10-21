#!/bin/bash
cd "$(dirname "$0")"
rsync --exclude ".git/" --exclude ".DS_Store" --exclude "sync.sh" --exclude "LICENSE" --exclude "README.md" -av . ~
source ~/.zshrc
chmod 750 ~
