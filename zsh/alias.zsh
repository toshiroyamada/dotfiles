# # --------------------------------------------------------------------
# # aliases
# # --------------------------------------------------------------------

# OS Detection
platform='unknown'
unamestr=`uname`
# Identify operating system...
if [[ "$unamestr" == 'Darwin' ]]; then
    platform='mac'
elif [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
else
    platform='cygwin' # because I live in only these three worlds...
fi

# Use MacVim's vim - check if we have MacVim ...
if [[ $platform == 'mac' ]] then
    if [ -f '/Applications/MacVim/MacVim.app/Contents/MacOS/Vim' ]; then
        alias vim='/Applications/MacVim/MacVim.app/Contents/MacOS/Vim'
    elif [ -f '/Applications/MacVim.app/Contents/MacOS/Vim' ]; then
        alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
    elif [ -f '/usr/local/bin/vim' ]; then
        alias vim='/usr/local/bin/vim'
    fi
fi

# Prevent accidental mv
alias mv='nocorrect mv'

# ditto is preferred to keep resource forks
if [[ $platform == 'mac' ]] then
    #alias ditto='nocorrect ditto'
    #alias cp='ditto'
    alias cp='nocorrect cp'
else
    alias cp='nocorrect cp'
fi

# Use GNU ls if possible
if [[ $platform == 'mac' ]] then
    if [ -f /usr/local/bin/ls ]; then
        alias ls='/usr/local/bin/ls -F --color=auto'
    else
        alias ls='ls -FG'
    fi
elif [[ $platform == 'linux' ]] then
    alias ls='ls --color=auto'
else
    alias ls='ls'
fi
alias ll='ls -l'
alias la='ls -a'

# Use ack instead of grep if present
#if [ -f ~/bin/ack ]; then
#    alias grep='~/bin/ack'
#fi

alias ..='cd ..'
alias .='pwd'

# MacVim is nicer than gVim on Mac
if [[ $platform == 'mac' ]] then
    alias gvim='mvim'
fi

# alias offlineimap-tty='offlineimap -u TTY.TTYUI'
# alias hnb-partecs='hnb $HOME/partecs/partecs-hnb.xml'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

if [[ $platform == 'linux' ]]; then
    alias parallel='parallel --gnu'
fi

# Git-specific shorthand aliases
alias git-log-graph='git log --graph --pretty="%h - %an = %s"'
