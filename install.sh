#!/usr/bin/env sh

rm ~/.bash_profile
rm ~/.gvimrc.after
rm ~/.tcshrc
rm ~/.vimrc.after

ln -s ~/.dotfiles/.bash_profile ~/.bash_profile
ln -s ~/.dotfiles/.gvimrc.after ~/.gvimrc.after
ln -s ~/.dotfiles/.tcshrc ~/.tcshrc
ln -s ~/.dotfiles/.vimrc.after ~/.vimrc.after

# Install Vim .janus extensions
DIR=~/.janus

# If the build directory exists, delete it
if [ -d "$DIR" ]; then
  rm -rf $DIR
fi

mkdir $DIR
cd $DIR

git clone git://github.com/joestelmach/javaScriptLint.vim.git
git clone git://github.com/tpope/vim-ragtag.git
git clone git://github.com/msanders/cocoa.vim.git
git clone git://github.com/Rip-Rip/clang_complete.git
git clone git://github.com/vim-scripts/loremipsum.git
git clone git://github.com/godlygeek/csapprox.git

