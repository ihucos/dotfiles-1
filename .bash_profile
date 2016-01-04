alias ls="ls -alG"
alias d="cd ~/Desktop"
alias u="cd .."
alias h="cd ~"
alias q="exit"
alias x="exit"
alias t="tree -C -d"

# This requires `brew install thefuck`
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'

# Some settings to get the battery level from the command line
export CUTE_BATTERY_INDICATOR=Yes
alias battery="~/.dotfiles/battery.sh Charging; ~/.dotfiles/battery.sh Discharging"

# Quick way to rebuild the Launch Services database and get rid
# of duplicates in the Open With submenu.
# http://www.leancrew.com/all-this/2013/02/getting-rid-of-open-with-duplicates/
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'

# Customize git log, taken from
# http://coderwall.com/p/euwpig?i=3&p=1&t=git
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
# Create a local server from any git repo
git config --global alias.serve "daemon --verbose --export-all --base-path=.git --reuseaddr --strict-paths .git/"

# Adapted from
# http://www.cocoanetics.com/2012/02/my-terminal-is-less-boring-than-yours/
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

export PATH=~/.cabal/bin:/usr/local/sbin:/usr/local/bin:.:$PATH
export EDITOR=vim
export NODE_PATH=/usr/local/lib/node_modules

# Fancy prompt
export PS1="\e[41m \u@\h: \D{%a %d %b %Y}, \t \e[m\n[\w]\n$ "
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

TERM=xterm-256color

