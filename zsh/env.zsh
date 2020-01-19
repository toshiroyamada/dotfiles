# # --------------------------------------------------------------------
# # Setup Environment Variables
# # --------------------------------------------------------------------
setopt ALL_EXPORT

TZ="America/San_Diego"
HISTFILE=$HOME/.zhistory
HISTSIZE=1000
SAVEHIST=1000
HOSTNAME="`hostname`"
PAGER='less'
EDITOR='vim'
#LANGUAGE=
LC_ALL='en_US.UTF-8'
LANG='en_US.UTF-8'
LC_CTYPE=C
#DISPLAY=:0

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

# Mac specific
if [[ $platform == 'mac' ]]; then
    # MacVim
    if [ -d '/Applications/MacVim' ]; then
        export VIM_APP_DIR=/Applications/MacVim
    else
        export VIM_APP_DIR=/Applications
    fi
    export EDITOR='${VIM_APP_DIR}/MacVim.app/Contents/MacOS/Vim'
    # Wireshark
    if [ -d '/Applications/Wireshark' ]; then
        export WIRESHARK_APP_DIR=/Applications/Wireshark
    fi
else
    export EDITOR='vim'
fi

# virtualenvwrapper
export WORKON_HOME=~/.virtualenv
if [ -e /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

unsetopt ALL_EXPORT
