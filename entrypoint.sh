#!/bin/bash

sudo service ssh restart

DOTFILES_VERSION=v0.0.1

if [[ ! -z ~/.dotfiles ]] || [[ $(cd ~/.dotfiles && git describe --tags) != $DOTFILES_VERSION ]]; then
    echo "Initializing kubox"

    rm -rf ~/.dotfiles
    git clone https://github.com/zzh8829/dotfiles.git ~/.dotfiles

    cd ~/.dotfiles
    git checkout tags/$DOTFILES_VERSION
    ./linux.sh
    ./dotfiles.sh
    ./vim.sh
fi

cd ~

exec "$@"
