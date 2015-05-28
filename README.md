# Dotfiles

This project contains configuration files for various command-line
tools.

## Requirements

This installation provides defaults for:

- [zsh][zsh] + [oh-my-zsh][ohmyzsh]
- [vim][vim] + [MacVim][macvim] + [Janus][janus]
- [tcsh][tcsh]
- [bash][bash]

You might want to install [Homebrew][homebrew], and then issue the
following commands:

- `brew install node`
- `brew install ctags` (required by the [Tagbar][tagbar] vim plugin)
- `brew install reattach-to-user-namespace` (required to be able to copy
  text from tmux to the OS X pasteboard)
- `npm install jshint -g` (required by the [JSHint][jshint] vim plugin)

For maximum compatibility with the [vim-airline plugin][airline], you
might want to install the patched version of [DejaVu Sans
Mono][dejavusans] and [Inconsolata for Powerline][dejavusans].

## Installation

- Install requirements as described in the next section.
- Clone the repo from Github into a hidden folder named .dotfiles:
    - `cd ~`
    - `git clone git@github.com:akosma/dotfiles.git .dotfiles`
    - `cd .dotfiles`
- Run the install.sh folder to create symlinks and clone plugins in the
  `~/.janus` folder:
    - `./install.sh`

## Features

These configuration files provide the following features, among many
others:

- In zsh:
    - Custom prompt with more information and with visual contrast.
    - The `ascstats` command shows statistics about number of words in
      the current Asciidoc files.
    - The `updateall` command updates of Homebrew, janus, and these
      dotfiles to the latest versions.
    - The `gitsvnpush` command synchronises a local Git repo with a
      remote Subversion repository.
    - Custom output for the `git log` command.
    - The `fixopenwith` command solves a common problem in OS X.
    - The `timestamp` command returns the current Unix epoch time.
- In tmux:
    - [SHIFT + left arrow] and [SHIFT + right arrow] switch windows to
      the next (or previous.)
    - [SHIFT + down arrow] creates new windows in the current session.
    - Battery level displayed in the status line.
    - Possible to copy text back and forth using the standard OS X
      pasteboard (thanks to `reattach-to-user-namespace`.)
- In Vim / MacVim:
    - [F5] opens [Gundo][gundo] at the left.
    - [F8] opens [Tagbar][tagbar] at the right.
    - [F6] removes whitespace from the current buffer.
    - [CTRL + N] toggles the [NERDTree][nerdtree] at the left.
    - [CTRL + T] and also [CMD + T] in MacVim open the [CtrlP][ctrlp]
      plugin window.
    - `zz` centers the current line in the middle of the screen in
      normal mode.
    - `<Leader>+json` formats the current JSON on the editor for
      readability.
    - `<Leader>+PR` toggles MacVim in a "presentation mode" with bigger
      fonts, for demos and teaching.
    - `<Leader>+WR` toggles MacVim in a "writer mode" with bigger fonts,
      nicer layout and tools for writing text.
    - `ctags` syntax definitions for [Asciidoc][asciidoc], Makefiles,
      [Markdown][markdown] and Objective-C.
    - Disables the standard JSLint plugin provided by Janus, and instead
      uses JSHint.

## Custom configuration

If you want to add your own configuration to zsh and tmux, add it to the
files named `.local_bash_profile` and `.local_tmux.conf` in the
`.dotfiles` folder; the contents of these two files will be loaded
automatically at the end of the respective configuration files.


[airline]:https://github.com/bling/vim-airline
[asciidoc]:http://www.methods.co.nz/asciidoc/
[bash]:http://en.wikipedia.org/wiki/Bash_(Unix_shell)
[ctrlp]:https://github.com/kien/ctrlp.vim
[dejavusans]:https://github.com/powerline/fonts
[gundo]:http://sjl.bitbucket.org/gundo.vim/
[homebrew]:http://brew.sh
[janus]:https://github.com/carlhuda/janus
[jshint]:https://github.com/Shutnik/jshint2.vim
[macvim]:https://github.com/b4winckler/macvim
[markdown]:http://daringfireball.net/projects/markdown/
[nerdtree]:https://github.com/scrooloose/nerdtree
[ohmyzsh]:https://github.com/robbyrussell/oh-my-zsh
[tagbar]:https://majutsushi.github.io/tagbar/
[tcsh]:http://www.tcsh.org/
[vim]:http://www.vim.org/
[zsh]:http://www.zsh.org/

