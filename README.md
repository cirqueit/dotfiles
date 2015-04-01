# Fresh Ubuntu deploy

## as root

### install basics
    
    apt-get update
    apt-get upgrade
    apt-get install sudo
    apt-get install git build-essential xclip automake autoconf
    apt-get install libevent-dev libncurses-dev pkg-config
    apt-get install wget zip curl cmake python-dev
    apt-get install clang ipython xcape vim-gnome

### install openvpn-as

    > 32 bit
    wget http://swupdate.openvpn.org/as/openvpn-as-2.0.12-Ubuntu14.i386.deb
    dpkg -i openvpn-as-2.0.12-Ubuntu14.i386.deb
    > 64 bit
    ?

    passwd openvpn

### add users

    useradd -d /home/xxx -m xxx
    passwd xxx
    vim /etc/sudoers
    xxx ALL=(ALL:ALL) ALL
    chsh -s /bin/bash xxx

## as user

### add ssh key

    mkdir -p .ssh
    scp .ssh/id_rsa.pub server:.ssh/authorized_keys

### tmux

    git clone git://git.code.sf.net/p/tmux/tmux-code tmux
    cd tmux
    curl -O https://gist.githubusercontent.com/ArnisL/6156593/raw/fdacd42e7a4ce725605c52655fcc04126630a7e6/tmux_24_bit_colours.c
    git apply tmux_24_bit_colors.c
    sh autogen.sh
    ./configure && make
    sudo make install

### neovim

    git clone https://github.com/neovim/neovim
    cd neovim
    make
    sudo make install
    pip install neovim

### iojs + npm

    git clone git://github.com/iojs/io.js
    cd io.js
    export CC=/usr/bin/clang
    export CXX=/usr/bin/clang++
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

### others

    sudo add-apt-repository ppa:webupd8team/java
    sudo apt-get update
    sudo apt-get install oracle-java8-installer

- leiningen (requires java)
- google drive
- chrome canary
