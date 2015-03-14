# Dotfiles

This project contains configuration files for command-line tools.

## Installation

- Install requirements as described in the next section.
- Clone the repo from Github into a hidden folder named .dotfiles:
    - `cd ~`
    - `git clone git@github.com:akosma/dotfiles.git .dotfiles`
    - `cd .dotfiles`
- Run the install.sh folder to create symlinks:
    - `./install.sh`

## Requirements

This installation provides defaults for:

- [zsh][6] + [oh-my-zsh][7]
- [vim][3] + [MacVim][1] + [Janus][2]
- [tcsh][5]
- [bash][4]

You might want to install [Homebrew][10], and then issue the following
commands:

- `brew tap homebrew/binary`
- `brew install jsl` (required by the javaScriptLint.vim plugin)

For maximum compatibility with the [vim-airline plugin][8], you might
want to install the patched version of [DejaVu Sans Mono][9].

[1]:http://code.google.com/p/macvim/
[2]:https://github.com/carlhuda/janus
[3]:http://www.vim.org/
[4]:http://en.wikipedia.org/wiki/Bash_(Unix_shell)
[5]:http://www.tcsh.org/Welcome
[6]:http://www.zsh.org/
[7]:https://github.com/robbyrussell/oh-my-zsh
[8]:https://github.com/bling/vim-airline
[9]:https://github.com/powerline/fonts
[10]:http://brew.sh

