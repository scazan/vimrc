#!/bin/bash

ln -s ~/.vimgit/.vimrc ~/.vimrc

mkdir ~/.vimswap && mkdir ~/.vimundo && touch ~/.vimrc.config

vim -c BundleInstall -c qall
