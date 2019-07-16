#!/bin/bash

DOTFILES_VERSION=v0.0.1
DOTFILES_INIT=0

if [[ ! -z ~/.dotfiles || cd ~/.dotfiles && $(git describe --tags)!=$DOTFILES_VERSION ]]; then
    echo "Initializing kubox"
    mkdir -p ~/Repos
    cd ~/Repos

    rm -rf dotfiles
    git clone https://github.com/zzh8829/dotfiles.git
    git checkout tags/v0.0.1

    cd dotfiles
    ./linux.sh
    ./dotfiles.sh
    ./vim.sh
fi

sleep infinity
