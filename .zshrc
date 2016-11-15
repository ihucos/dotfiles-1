# Customize to your needs...
export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Library/TeX/texbin:/opt/local/bin

# Path for the command-line Swift.org distribution
export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:"${PATH}"

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Please.
DISABLE_CORRECTION="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(tmux git brew github osx encode64 jsontools osx urltools)

source $ZSH/oh-my-zsh.sh

# Custom prompt. A real mess, but that's how I like it :)
PROMPT='%{$bg[red]%}%{$fg[white]%} %n@%m: %D{%a %d %b %Y}, %* %{$reset_color%}
%{$fg[white]%}[%~]
%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}% %{$reset_color%}'

# To be able to use `symbolicatecrash` we need this variable:
export DEVELOPER_DIR=`xcode-select --print-path`

# For Android stuff
export ANDROID_HOME=/usr/local/opt/android-sdk

# Setting some defaults for MacVim
defaults write org.vim.MacVim MMTextInsetBottom 10
defaults write org.vim.MacVim MMTextInsetLeft 10
defaults write org.vim.MacVim MMTextInsetRight 10
defaults write org.vim.MacVim MMTextInsetTop 10

# Required by Homebrew
export HOMEBREW_TEMP=/tmp

# Shoulda done this a long time ago
export EDITOR=vim

# Required by Mosh
LC_CTYPE="en_US.UTF-8"

# Avoid beeps
setopt NO_BEEP

# Setup rbenv for the current session
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Some custom commands go here
function tmuxx {
    tmux ls | grep akosma
    if [ $? -eq 0 ]
    then
        echo "Session found, attaching"
    else
        echo "Session not found, creating new one"
        tmux new-session -d -n "book" -s akosma "vim ."
        tmux new-window -n "commands"
        tmux split-window -h
        tmux new-window -n "dotfiles" "vim ~/.dotfiles"
        tmux select-window -t 1
    fi

    tmux -2 -u attach-session -t akosma
}

function gitsvnpush {
    git svn rebase
    git svn dcommit
}

function updateall {
    original_path=`pwd`
    upgrade_oh_my_zsh

    echo "----------------------------"
    printf '\033[0;34m%s\033[0m\n' "Upgrading .dotfiles"
    cd ~/.dotfiles
    git status
    git pull

    echo "----------------------------"
    printf '\033[0;34m%s\033[0m\n' "Upgrading Homebrew"
    brew update
    brew upgrade --all
    brew cleanup
    brew prune
    brew linkapps
    brew doctor

    echo "----------------------------"
    printf '\033[0;34m%s\033[0m\n' "Upgrading npm"
    npm upgrade -g
    npm update -g

    echo "----------------------------"
    printf '\033[0;34m%s\033[0m\n' "Upgrading Rubygems"
    gem update --system
    gem update

    echo "----------------------------"
    printf '\033[0;34m%s\033[0m\n' "Upgrading Mac App Store apps"
    mas upgrade

    echo "----------------------------"
    printf '\033[0;34m%s\033[0m\n' "Upgrading Vim plugins"
    cd ~/.vim/bundle
    for dir in */ ; do
        printf '\033[0;34m%s\033[0m\n' "Upgrading $dir"
        cd $dir
        git pull
        cd ..
    done
    cd $original_path
}

function ascstats {
    wc -w *.asc
}

function timestamp {
    date -j -f "%a %b %d %T %Z %Y" "`date`" "+%s"
}

# Courtesy of Brett Terpstra
# Open argument in Dash
# http://brettterpstra.com/2014/05/10/bash-and-dash/
function dash() {
    open "dash://$*"
}

function dman() {
    open "dash://manpages:$*"
}

# Some custom configuration and aliases, not present in every computer
source $HOME/.aliases
if [ -f $HOME/.local_bash_profile ]; then
    source $HOME/.local_bash_profile
fi


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
