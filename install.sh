#!/usr/bin/env sh

files=(.ackrc .bash_profile .gvimrc.after .tcshrc .vimrc.after .vimrc.before .inputrc .zshrc .tmux.conf .ctags)

len=${#files[*]}
i=0
while [ $i -lt $len ]; do
    file="${files[$i]}"
    rm ~/$file
    ln -s ~/.dotfiles/$file ~/$file
    let i++
done

# Install Vim .janus extensions
DIR=~/.janus

# If the build directory exists, delete it
if [ -d "$DIR" ]; then
  rm -rf $DIR
fi

# Create the required extensions dir
mkdir $DIR

# Manually install Vim plugins
cp -R other/asciidoc $DIR
cp -R other/jslint $DIR

# Clone remote Vim plugins
cd $DIR
git clone git://github.com/tpope/vim-ragtag.git
git clone git://github.com/vim-scripts/loremipsum.git
git clone git://github.com/vim-scripts/YankRing.vim.git
git clone git://github.com/Lokaltog/vim-powerline.git
git clone git://github.com/kana/vim-smartinput.git
git clone git://github.com/tomtom/tcomment_vim
git clone git://github.com/vim-scripts/taglist.vim.git
git clone git://github.com/kballard/vim-swift.git
git clone git://github.com/rizzatti/dash.vim.git

