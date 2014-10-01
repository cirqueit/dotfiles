##Fresh installs

#OSX install
- iterm2
- drive
- fish
- brew
    - reattach-to-user-namespace
    - git
    - tmux
    - macvim

#Linux install
- xclip

#All install
- chrome canary
- leinigen
- node

#npm -g
> sudo chown -R $USER /usr/local
- coffee-script
- gulp
- bower
- slush
- cirqueit/slush-soda


#Git
- dotfiles

        git clone https://github.com/cirqueit/dotfiles.git ~/dotfiles

- Vundle 

        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#Symlink dotfiles
- .vimrc
- .fishrc -> .config/fish/config.fish
- .tmux.conf
