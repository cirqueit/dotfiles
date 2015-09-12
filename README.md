# Fresh Ubuntu deploy

## as root

### install basics
   
    apt-get update
    apt-get upgrade
    apt-get install sudo
    apt-get install language-pack-en-base
    dpkg-reconfigure locales
    
    apt-get install git build-essential libtool xclip automake autoconf
    apt-get install libevent-dev libncurses-dev pkg-config
    apt-get install wget zip curl cmake python-dev
    apt-get install clang ipython vim-gnome
 

### install openvpn-as

    > 32 bit
    wget http://swupdate.openvpn.org/as/openvpn-as-2.0.12-Ubuntu14.i386.deb
    dpkg -i openvpn-as-2.0.12-Ubuntu14.i386.deb
    > 64 bit
    ?

    passwd openvpn

### add users

  adduser USER
  adduser USER sudo

## as user

### add ssh key

    mkdir -p .ssh
    scp .ssh/id_rsa.pub server:.ssh/authorized_keys

### tmux

    git clone https://github.com/tmux/tmux
    cd tmux
    sh autogen.sh
    ./configure && make
    sudo make install

### neovim

    git clone https://github.com/neovim/neovim
    cd neovim
    make
    sudo make install
    pip install neovim

### ctags

    git clone https://github.com/fishman/ctags
    cd ctags
    autoreconf
    ./configure
    make
    sudo make install

### nodejs

    git clone https://github.com/nodejs/node
    cd node
    ./configure && make
    sudo make install
    
    sudo chown -R $USER /usr/local

    npm install -g bower
    npm install -g coffee-script
    npm install -g gulp
    npm install -g slush
    npm install -g cirqueit/slush-soda
    npm install -g babel
    npm install -g react-tools

### dotfiles
    
    git clone git://github.com/cirqueit/dotfiles
    cd dotfiles && ./setup.sh
    vim -> :PlugInstall

### java8
    sudo apt-get install software-properties-common
    sudo add-apt-repository ppa:webupd8team/java
    sudo apt-get update
    sudo apt-get install oracle-java8-installer
