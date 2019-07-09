#!/bin/sh

set -ex

mkdir -p ~/Repos
cd ~/Repos
git clone https://github.com/zzh8829/dotfiles.git
cd dotfiles

./linux.sh
./dotfiles.sh
