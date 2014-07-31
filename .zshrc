# Customize to your needs...
export PATH=~/.cabal/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/texbin:/opt/local/bin

# Trick coming from
# http://stackoverflow.com/a/14138490/133764
export PATH=$(brew --prefix ruby)/bin:$PATH

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
%{$fg[red]%}[%~]
%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

# To be able to use `symbolicatecrash` we need this variable:
export DEVELOPER_DIR=`xcode-select --print-path`

# Some aliases
alias d="cd ~/Desktop"
alias u="cd .."
alias h="cd ~"
alias q="exit"
alias x="exit"

# Some settings to get the battery level from the command line
export CUTE_BATTERY_INDICATOR=Yes
alias battery="~/.dotfiles/battery.sh Charging; ~/.dotfiles/battery.sh Discharging"

# Setting some defaults for MacVim
defaults write org.vim.MacVim MMTextInsetBottom 10
defaults write org.vim.MacVim MMTextInsetLeft 10
defaults write org.vim.MacVim MMTextInsetRight 10
defaults write org.vim.MacVim MMTextInsetTop 10

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

    #echo "============================"
    #echo "Updating NPM"
    #npm update -g

    echo "============================"
    echo "Updating Haskell / cabal"
    cabal update

    #echo "============================"
    #echo "Updating Rubygems (requires Ruby 1.9)"
    #gem update --system
    #gem update

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
}

function ascstats {
    wc -w *.asc
}

