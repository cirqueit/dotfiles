# Fresh deploy

## osx

- iterm2
- homebrew

### brew

- reattach-to-user-namespace
- git
- macvim

## linux

###add users

    useradd -d /home/xxx -m xxx
    passwd xxx
    vim /etc/sudoers
    xxx ALL=(ALL:ALL) ALL

###add ssh key

    mkdir -p .ssh
    scp .ssh/id_rsa.pub server:.ssh/authorized_keys

#update apt-get and install basics
    
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install git build-essential xclip automake autoconf
    sudo apt-get install libevent-dev libncurses-dev pkg-config
    sudo apt-get install nodejs nodejs-legacy npm

## all

### tmux

    git clone git://git.code.sf.net/p/tmux/tmux-code tmux
    cd tmux
    sh autogen.sh
    ./configure && make

### fish

    git clone git://github.com/fish-shell/fish-shell
    autoconf
    ./configure
    make
    sudo make install
    sudo vim /etc/shells   -> add /usr/local/bin/fish to end of list
    sudo vim /etc/passwd   -> add /usr/local/bin/fish to end of users


### npm
    
    sudo npm install -g bower
    sudo npm install -g coffee-script
    sudo npm install -g gulp
    sudo npm install -g slush
    sudo npm install -g cirqueit/slush-soda

### dotfiles
    
    git clone git://github.com/cirqueit/dotfiles
    cd dotfiles && ./setup.sh
    vim -> :PlugInstall

### others

- leiningen (requires java)
- google drive
- chrome canary
