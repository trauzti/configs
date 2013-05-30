#!/bin/sh
rm -rf vim
cp -r ~/.vim vim
cp ~/.i3/config i3config
cp ~/.vimrc vimrc
cp ~/.gdbinit gdbinit 
cp ~/.bashrc bashrc

git add vim i3config vimrc gitconfig gdbinit bashrc
git add get.sh
git commit -m"Update"
git push origin master
