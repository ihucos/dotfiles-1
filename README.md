Dotfiles
========

This folder, stored as a git repo, contains all the configuration files
I regularly use for command-line apps.

Installation
------------

- Clone the repo from Github into a hidden folder named .dotfiles:
    - `cd ~`
    - `git clone git@github.com:akosmasoftware/dotfiles.git .dotfiles`
- Run the install.sh folder to create symlinks:
    - `.dotfiles/install.sh`
- Boum! You have configured a new computer with your preferred defaults.

Vim Plugins
-----------

The following plugins are installed by the `install.sh` plugin:

- http://github.com/joestelmach/javaScriptLint.vim
- http://github.com/tpope/vim-ragtag
- http://github.com/msanders/cocoa.vim
- http://github.com/Rip-Rip/clang_complete
- http://github.com/vim-scripts/loremipsum
- http://github.com/vim-scripts/YankRing.vim
- http://github.com/Lokaltog/vim-powerline
- http://github.com/kana/vim-smartinput

Requirements
------------

This installation provides defaults for:

- [tcsh][5]
- [bash][4]
- [vim][3] + [MacVim][1] + [Janus][2]
- [zsh][6] + [oh-my-zsh][7]

For maximum compatibility with the [Powerline plugin][8], you might want
to download a patched version of [Bitstream Vera Sans Mono][9].

[1]:http://code.google.com/p/macvim/
[2]:https://github.com/carlhuda/janus
[3]:http://www.vim.org/
[4]:http://en.wikipedia.org/wiki/Bash_(Unix_shell)
[5]:http://www.tcsh.org/Welcome
[6]:http://www.zsh.org/
[7]:https://github.com/robbyrussell/oh-my-zsh
[8]:https://github.com/Lokaltog/vim-powerline
[9]:https://gist.github.com/1695735/

