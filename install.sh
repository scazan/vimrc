#!/bin/bash

ln -s ~/dev/vimrc/.vimrc ~/.vimrc

mkdir ~/.vimswap && mkdir ~/.vimundo && touch ~/.vimrc.config

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp ./other/init.vim /home/scott/.config/nvim/init.vim

sudo apt-get install exuberant-ctags

nvim -c PlugInstall -c qall
