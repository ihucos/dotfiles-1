alias ls="ls -alG"
alias dir="ls -al"
alias d="cd ~/Desktop"
alias u="cd .."
alias h="cd ~"
alias q="exit"
alias x="q"

alias mysql="/Applications/MAMP/Library/bin/mysql --user=root --password=root"
alias status="svn status --ignore-externals"
alias keywords="svn propset svn:keywords 'LastChangedDate LastChangedRevision LastChangedBy HeadURL Id' *"
alias akosma="ssh akosma@akosma.com"
alias swissalertmap="ssh swissale@swissalertmap.ch"
alias emulator="/Applications/android-sdk-mac_86/tools/emulator -avd Gingerbread &"

export PATH=~/.cabal/bin:/sw/bin:/usr/local/git/bin:/usr/local/bin:/usr/local/mysql/bin:/usr/share/pear/bin:/opt/local/bin:$PATH
export EDITOR=vim
export NODE_PATH=/usr/local/lib/node_modules

# Fancy prompt
export PS1="\e[41m \u@\h: \D{%a %d %b %Y}, \t \e[m\n[\w]\n$ "
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

TERM=xterm-256color

# export ARCHFLAGS="-arch x86_64"


##
# Your previous /Users/adrian/.bash_profile file was backed up as /Users/adrian/.bash_profile.macports-saved_2011-12-01_at_23:19:28
##

# MacPorts Installer addition on 2011-12-01_at_23:19:28: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

