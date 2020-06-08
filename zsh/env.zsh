# # --------------------------------------------------------------------
# # Setup Environment Variables
# # --------------------------------------------------------------------
setopt ALL_EXPORT

TZ="America/Los_Angeles"
HISTFILE=$HOME/.zhistory
HISTSIZE=10000
SAVEHIST=10000
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
    # Wireshark
    if [ -d '/Applications/Wireshark' ]; then
        export WIRESHARK_APP_DIR=/Applications/Wireshark
    fi
fi
export EDITOR='vim'

# virtualenvwrapper
export WORKON_HOME=~/.virtualenv
if [ -e /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

unsetopt ALL_EXPORT
