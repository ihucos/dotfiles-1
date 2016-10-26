#!/usr/bin/env sh

files=(.jshintrc .ackrc .aliases .bash_profile .tcshrc .inputrc .zshrc .tmux.conf .ctags)

len=${#files[*]}
i=0
while [ $i -lt $len ]; do
    file="${files[$i]}"
    rm ~/$file
    ln -s ~/.dotfiles/$file ~/$file
    let i++
done

ln -s ~/.dotfiles/vimrc ~/.vim/vimrc
ln -s ~/.dotfiles/gvimrc ~/.vim/gvimrc

#touch ~/.dotfiles/.local_bash_profile
#touch ~/.dotfiles/.local_tmux.conf
#ln -s ~/.dotfiles/.local_bash_profile ~/.local_bash_profile
#ln -s ~/.dotfiles/.local_tmux.conf ~/.local_tmux.conf

# Install Vim plugins here
DIR=~/.vim/bundle

# Manually install Vim plugins
cp -R other/asciidoc $DIR

cd $DIR
git clone https://github.com/NLKNguyen/papercolor-theme.git
git clone https://github.com/Raimondi/delimitMate.git
git clone https://github.com/airblade/vim-gitgutter.git
git clone https://github.com/bronson/vim-trailing-whitespace.git
git clone https://github.com/chrisbra/NrrwRgn.git
git clone https://github.com/ctrlpvim/ctrlp.vim.git
git clone https://github.com/elzr/vim-json.git
git clone https://github.com/jacquesbh/vim-showmarks.git
git clone https://github.com/keith/swift.vim.git
git clone https://github.com/majutsushi/tagbar.git
git clone https://github.com/mattn/emmet-vim.git
git clone https://github.com/mileszs/ack.vim.git
git clone https://github.com/mkitt/tabline.vim.git
git clone https://github.com/reedes/vim-colors-pencil.git
git clone https://github.com/reedes/vim-pencil.git
git clone https://github.com/scrooloose/nerdcommenter.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/sjl/gundo.vim.git
git clone https://github.com/terryma/vim-multiple-cursors.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/vim-airline/vim-airline-themes.git
git clone https://github.com/vim-airline/vim-airline.git
git clone https://github.com/vim-scripts/YankRing.vim.git

