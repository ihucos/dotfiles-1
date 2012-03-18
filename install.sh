#!/usr/bin/env sh

files=(.bash_profile .gvimrc.after .tcshrc .vimrc.after .vimrc.before .inputrc .zshrc)

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

# Manually install asciidoc plugin
cp -R other/asciidoc $DIR

# Clone repos with other plugins
cd $DIR
git clone git://github.com/joestelmach/javaScriptLint.vim.git
git clone git://github.com/tpope/vim-ragtag.git
git clone git://github.com/msanders/cocoa.vim.git
git clone git://github.com/Rip-Rip/clang_complete.git
git clone git://github.com/vim-scripts/loremipsum.git
git clone git://github.com/vim-scripts/YankRing.vim.git

