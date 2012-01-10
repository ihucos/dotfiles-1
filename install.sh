#!/usr/bin/env sh

rm ~/.bash_profile
rm ~/.gvimrc.after
rm ~/.tcshrc
rm ~/.vimrc.after

ln -s ~/.dotfiles/.bash_profile ~/.bash_profile
ln -s ~/.dotfiles/.gvimrc.after ~/.gvimrc.after
ln -s ~/.dotfiles/.tcshrc ~/.tcshrc
ln -s ~/.dotfiles/.vimrc.after ~/.vimrc.after

