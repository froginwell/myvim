#!/bin/bash
if [ ! -d ~/.vim ]
then
    mkdir ~/.vim
fi

# vim config
find . -type f | egrep -v ".git|.gitignore|install.sh|myvim.png|README.md" | cpio -admvp ~/.vim

# install youcompleteme
sudo apt-get install -y vim-youcompleteme
sudo apt-get install -y vam-addon-manager
vam install youcompleteme

# install yapf
sudo pip install yapf
