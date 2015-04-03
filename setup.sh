#!/bin/bash

ln -sf $(pwd)/.vimrc  ~/.vimrc
ln -sf $(pwd)/.tmux.conf ~/.tmux.conf
ln -sf $(pwd)/.bash_aliases ~/.bash_aliases

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

ln -sf ~/.vimrc  ~/.nvimrc
ln -sf ~/.vim  ~/.nvim

source $(pwd)/git_template.sh
