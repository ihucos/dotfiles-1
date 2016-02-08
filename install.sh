#!/usr/bin/env sh

files=(.jshintrc .ackrc .aliases .bash_profile .gvimrc.after .tcshrc .vimrc.after .vimrc.before .inputrc .zshrc .tmux.conf .ctags)

len=${#files[*]}
i=0
while [ $i -lt $len ]; do
    file="${files[$i]}"
    rm ~/$file
    ln -s ~/.dotfiles/$file ~/$file
    let i++
done

touch ~/.dotfiles/.local_bash_profile
touch ~/.dotfiles/.local_tmux.conf
ln -s ~/.dotfiles/.local_bash_profile ~/.local_bash_profile
ln -s ~/.dotfiles/.local_tmux.conf ~/.local_tmux.conf

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

# Clone remote Vim plugins
cd $DIR
git clone git://github.com/tpope/vim-ragtag.git
git clone git://github.com/vim-scripts/loremipsum.git
git clone git://github.com/vim-scripts/YankRing.vim.git
git clone git://github.com/bling/vim-airline.git
git clone git://github.com/kana/vim-smartinput.git
git clone git://github.com/tomtom/tcomment_vim
git clone git://github.com/vim-scripts/taglist.vim.git
git clone git://github.com/toyamarinyon/vim-swift.git
git clone git://github.com/rizzatti/dash.vim.git
git clone git://github.com/mattn/emmet-vim.git
git clone git://github.com/Shutnik/jshint2.vim.git
git clone git://github.com/NLKNguyen/papercolor-theme.git
git clone git://github.com/reedes/vim-wordy.git
git clone git://github.com/reedes/vim-colors-pencil.git
git clone git://github.com/reedes/vim-pencil.git
git clone git://github.com/reedes/vim-lexical.git
git clone git://github.com/nacitar/a.vim.git
git clone git://github.com/b4winckler/vim-objc.git
git clone git://github.com/msanders/cocoa.vim.git

