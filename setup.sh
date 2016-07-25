#!/bin/bash

ln -sf $(pwd)/.vimrc  ~/.vimrc
ln -sf $(pwd)/.tmux.conf ~/.tmux.conf
ln -sf $(pwd)/.bash_aliases ~/.bash_aliases
ln -sf $(pwd)/.bash_prompt ~/.bash_prompt
echo "source ~/.bash_aliases" >> ~/.bashrc
echo "source ~/.bash_prompt" >> ~/.bashrc
cp $(pwd)/.pythonrc ~/.pythonrc
# mkdir -p ~/.config/ipython/profile_default
# ln -sf $(pwd)/ipython_config.py ~/.config/ipython/profile_default/ipython_config.py

if [ "$(uname)" == "Darwin" ]; then
    ln -sf $(pwd)/.tmux.osx.conf ~/.tmux.osx.conf
else
    ln -sf $(pwd)/.tmux.linux.conf ~/.tmux.linux.conf
fi

mkdir -p ~/.vim/undo
mkdir -p ~/.vim/autoload

curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -flo ~/.z.sh https://raw.githubusercontent.com/rupa/z/master/z.sh

curl -fLO https://raw.githubusercontent.com/rupa/z/master/z.sh
ln -sf $(pwd)/z.sh ~/.z.sh

mkdir -p ~/bin
curl -fLo ~/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
chmod +x ~/bin/lein

ln -sf ~/.viminfo  ~/.vim/shada/main.shada
ln -sf ~/.vimrc  ~/.vim/init.vim
mkdir -p ~/.config
ln -sf ~/.vim  ~/.config/nvim

source $(pwd)/git_template.sh
