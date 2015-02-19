#!/bin/bash

ln -s $(pwd)/.vimrc  ~/.vimrc
ln -s $(pwd)/.tmux.conf ~/.tmux.conf

if [ "$(uname)" == "Darwin" ]; then
    mkdir -p ~/.ipython/profile_default
    ln -s $(pwd)/ipython_config.py ~/.ipython/profile_default/ipython_config.py
    ln -s $(pwd)/.tmux.osx.conf ~/.tmux.osx.conf
else
    mkdir -p ~/.config/ipython/profile_default
    ln -s $(pwd)/ipython_config.py ~/.config/ipython/profile_default/ipython_config.py
    ln -s $(pwd)/.tmux.linux.conf ~/.tmux.linux.conf
fi

mkdir -p ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
