#!/bin/bash

ln -s ~/dev/vimrc/.vimrc ~/.vimrc

mkdir ~/.vimswap && mkdir ~/.vimundo && touch ~/.vimrc.config

vim -c BundleInstall -c qall
