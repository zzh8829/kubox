#!/bin/sh

set -ex

mkdir -p ~/Repos
cd ~/Repos

rm -rf dotfiles
git clone https://github.com/zzh8829/dotfiles.git

cd dotfiles
./linux.sh
./dotfiles.sh

exec zsh -l
