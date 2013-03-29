# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git node brew github osx)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/Users/adrian/bin/Sencha/Cmd/3.0.2.288:/Users/adrian/.cabal/bin:/usr/local/sbin:/usr/local/bin:.:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/texbin:/opt/local/bin

# Trick coming from
# http://stackoverflow.com/a/14138490/133764
export PATH=$(cd $(which gem)/..; pwd):$PATH

# Required for the Pragmatic Programmer toolkit
export JAVA_HOME=/Library/Java/Home

# To be able to use `symbolicatecrash` we need this variable:
export DEVELOPER_DIR=`xcode-select --print-path`

# For Android development
export ANDROID_HOME=/Applications/Android/sdk

# Some aliases
alias ls="ls -alG"
alias d="cd ~/Desktop"
alias u="cd .."
alias h="cd ~"
alias q="exit"
alias x="exit"

alias git-svn-clone-externals=~/.janus/git-svn-clone-externals/git-svn-clone-externals

# Some settings to get the battery level from the command line
export CUTE_BATTERY_INDICATOR=Yes
alias battery="~/.dotfiles/battery.sh Charging; ~/.dotfiles/battery.sh Discharging"

# This comes from
# http://forums.pragprog.com/forums/242/topics/10474
# alias tmux="TERM=screen-256color-bce tmux -u"

# Avoid having a hidden ~/Library folder in Lion!
chflags nohidden ~/Library

# Setting some defaults for MacVim 
defaults write org.vim.MacVim MMTextInsetBottom 10
defaults write org.vim.MacVim MMTextInsetLeft 10
defaults write org.vim.MacVim MMTextInsetRight 10
defaults write org.vim.MacVim MMTextInsetTop 10

# Custom prompt. A real mess, but that's how I like it :)
PROMPT='%{$bg[red]%}%{$fg[white]%} %n@%m: %D{%a %d %b %Y}, %* %{$reset_color%}
%{$fg[red]%}[%~]
%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# Required by Homebrew
export HOMEBREW_TEMP=/tmp

# Required by Mosh
LC_CTYPE="en_US.UTF-8"

# Customize git log, taken from
# http://coderwall.com/p/euwpig?i=3&p=1&t=git
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"

# Avoid beeps
setopt NO_BEEP

# Quick way to rebuild the Launch Services database and get rid
# of duplicates in the Open With submenu.
# http://www.leancrew.com/all-this/2013/02/getting-rid-of-open-with-duplicates/
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'

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
    echo "============================"
    echo "Move MacPorts out of the way temporarily"
    sudo mv /opt/local ~/.tempmacports

    echo "============================"
    echo "Updating oh my zsh"
    upgrade_oh_my_zsh
    zsh_stats
    
    echo "============================"
    echo "Updating .dotfiles"
    cd ~/.dotfiles
    git pull
    
    echo "============================"
    echo "Updating Homebrew"
    brew update
    brew upgrade

    echo "============================"
    echo "brew cleanup"
    brew cleanup

    echo "============================"
    echo "brew linkapps"
    rm -r ~/Applications
    mkdir ~/Applications
    brew linkapps

    echo "============================"
    echo "brew doctor"
    brew doctor

    echo "============================"
    echo "Updating Haskell / cabal"
    cabal update

    echo "============================"
    echo "Updating Rubygems (requires Ruby 1.9)"
    gem update --system
    gem update

    echo "============================"
    echo "Updating Janus"
    cd ~/.vim
    rake

    cd ~/.janus
    for dir in *; do
        echo "============================"
        echo "Updating $dir"
        cd $dir
        git pull
        cd ..
    done

    echo "============================"
    echo "Restore MacPorts"
    sudo mv ~/.tempmacports /opt/local
}

function ascstats {
    wc -w *.asc    
}

# This is inspired from
# https://github.com/joho/terminal-stuff/blob/master/bashrc
fortune

