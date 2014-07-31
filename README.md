Dotfiles
========

This folder, stored as a git repo, contains all the configuration files
I regularly use for command-line apps.

Installation
------------

- Install requirements as described in the next section.
- Clone the repo from Github into a hidden folder named .dotfiles:
    - `cd ~`
    - `- http://github.com/akosma/dotfiles.git .dotfiles`
- Run the install.sh folder to create symlinks:
    - `.dotfiles/install.sh`
- Boum! You have configured a new computer with your preferred defaults.

Requirements
------------

This installation provides defaults for:

- [tcsh][5]
- [bash][4]
- [vim][3] + [MacVim][1] + [Janus][2]
- [zsh][6] + [oh-my-zsh][7]

For maximum compatibility with the [Powerline plugin][8], you might want
to download a patched version of [Bitstream Vera Sans Mono][9].

You might also want to install [Homebrew][10], and then issue the
following commands:

- `brew tap homebrew/binary`
- `brew install jsl` (required by the javaScriptLint.vim plugin)

[1]:http://code.google.com/p/macvim/
[2]:https://github.com/carlhuda/janus
[3]:http://www.vim.org/
[4]:http://en.wikipedia.org/wiki/Bash_(Unix_shell)
[5]:http://www.tcsh.org/Welcome
[6]:http://www.zsh.org/
[7]:https://github.com/robbyrussell/oh-my-zsh
[8]:https://github.com/Lokaltog/vim-powerline
[9]:https://gist.github.com/1695735/
[10]:http://brew.sh

