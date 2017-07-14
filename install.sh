#!/bin/bash

# install vim
sudo apt-get install -y python-dev python3-dev libncurses5-dev
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge --enable-python3interp --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ --enable-rubyinterp --enable-luainterp --enable-perlinterp --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu/ --enable-multibyte --enable-cscope --prefix=/usr/local/vim/
make
sudo make install
sudo ln -s /usr/local/vim/bin/vim /usr/local/bin/vim

# vim config
if [ ! -d ~/.vim ]
then
    mkdir ~/.vim
fi

find . -type f | egrep -v ".git|.gitignore|install.sh|myvim.png|README.md" | cpio -admvp ~/.vim

# install youcompleteme
sudo --set-home pip install requests-future
sudo apt-get install -y vim-youcompleteme
sudo apt-get install -y vam-addon-manager
vam install youcompleteme

# install yapf
sudo pip install yapf
