#!/bin/bash

mkdir -p ~/.config/fish
ln -s $(pwd)/config.fish ~/.config/fish/config.fish
ln -s $(pwd)/.vimrc  ~/.vimrc
ln -s $(pwd)/.tmux.conf ~/.tmux.conf

if [ "$(uname)" == "Darwin" ]; then
    ln -s $(pwd)/config.osx.fish ~/.config/fish/config.osx.fish
    ln -s $(pwd)/.tmux.osx.conf ~/.tmux.osx.conf
else
    ln -s $(pwd)/config.linux.fish ~/.config/fish/config.linux.fish
    ln -s $(pwd)/.tmux.linux.conf ~/.tmux.linux.conf
fi

# git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
