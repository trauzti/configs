#!/bin/sh
rm -rf vim
cp -r ~/.vim vim
cp ~/.i3/config i3config
cp ~/.vimrc vimrc
cp ~/.gdbinit gdbinit 
cp ~/.bashrc bashrc

git commit -a -m"Update"
git push origin master
