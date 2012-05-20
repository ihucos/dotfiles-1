# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git node brew github osx)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/Applications/SenchaSDKTools-2.0.0-beta3:/Users/adrian/.cabal/bin:/usr/local/sbin:/usr/local/bin:.:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/texbin

# Some aliases
alias ls="ls -alG"
alias d="cd ~/Desktop"
alias u="cd .."
alias h="cd ~"
alias q="exit"
alias x="exit"

# This comes from
# http://forums.pragprog.com/forums/242/topics/10474
alias tmux="TERM=screen-256color-bce tmux -u"

# Command line Twitter client
alias earthquake="/usr/local/Cellar/ruby/1.9.3-p125/lib/ruby/gems/1.9.1/gems/earthquake-0.8.5/bin/earthquake"

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

# Required by Mosh
LC_CTYPE="en_US.UTF-8"

# Some custom commands go here
function tmuxx {
    tmux ls | grep akosma
    if [ $? -eq 0 ]
    then
        echo "Session found, attaching"
    else
        echo "Session not found, creating new one"
        tmux new-session -d -s akosma "vim ."

        # tmux split-window -h
        # tmux resize-pane -R 30
        # tmux split-window
        # tmux resize-pane -D 10
        # tmux resize-pane -R 50
        # tmux clock-mode
        # tmux select-pane -t 2
        # tmux select-pane -t 1
        tmux new-window
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
    echo "Updating Homebrew"
    brew update
    brew upgrade

    echo "============================"
    echo "brew doctor"
    brew doctor

    echo "============================"
    echo "Updating npm"
    curl http://npmjs.org/install.sh | sh
    npm update

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
}

function ascstats {
    wc -mlw *.asc    
}

