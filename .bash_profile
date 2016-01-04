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

source $HOME/.aliases

