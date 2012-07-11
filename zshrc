######################################################################
#
#		      Toshiro's zshrc file
#
######################################################################

# # --------------------------------------------------------------------
# # OS Detection
# # --------------------------------------------------------------------

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

# # --------------------------------------------------------------------
# # Options (http://zsh.sourceforge.net/Doc/Release/Options.html)
# # --------------------------------------------------------------------

# Changing directories
setopt autocd               # cd without typing cd
setopt autopushd            # automatically pushd the old directory 
unsetopt cdable_vars        # expand cd argument as if it was preceded by '~'
unsetopt chase_dots         # resolve sym links when using '..' in path
unsetopt chase_links        # resolve sym links. include effect of chase_dots
setopt pushd_ignore_dups    # don't push multiple copies of same directories
setopt pushdminus           # exchanges meanings of '+' & '-' when used with
                            # number to specify a directory in the stack
setopt pushdsilent          # Don't print directory stack after pushd or popd
setopt pushd_to_home        # pushd with no argument = 'pushd $HOME'

# Completion
setopt always_last_prompt   # return to last prompt if given no numeric argument
unsetopt always_to_end      # move cursor to the end of word after completion
setopt auto_list            # automatically list choices
unsetopt auto_menu          # automatically use menu completition after 2nd tab
setopt auto_name_dirs       # ???
setopt auto_param_keys      # delete space if param key inserted
setopt auto_param_slash     # add slash after directory name completion
unsetopt auto_remove_slash  # if next typed is word delimiter, remove slash
unsetopt bash_auto_list     # list choicoes when hit tab twice in succession.
                            # takes precedence over auto_list
setopt complete_aliases     # prevent aliases from substituted before completion
setopt complete_in_word     # if unset, put cursor to the end of the word if 
                            # completion is started
unsetopt glob_complete      # match with glob pattern
unsetopt hash_list_all      # hash cmd path whenever cmd completion is attempt
unsetopt list_ambiguous     # autolisting only when nothing would be inserted
unsetopt list_beep          # beep on an ambiguous completion
unsetopt list_packed        # completion list less lines, varying column widths
unsetopt list_rows_first    # layout matches sorted horizontally
setopt list_types           # show type of each file with identifying mark
unsetopt menu_complete      # insert the first completion list
setopt rec_exact            # recognize exact matches even if they're ambiguous

# Expansion and Globbing
setopt bad_pattern          # print error if pattern is badly formed
#setopt bare_glob_qual
#setopt brace_ccl
setopt case_glob            # make globbing sensitive to case
setopt case_match           # make regular expressions sensitive to case
#setopt csh_null_glob
#setopt equals
#setopt extended_glob       # use '#', '~', and '^' as part of patterns
setopt glob                 # perform filename generation
#setopt glob_assign
setopt glob_dots            # do not require leading '.' in a filename
#setopt glob_subst
#setopt hist_subst_pattern
#setopt ignore_braces
#setopt ksh_glob
#setopt magic_equal_subst
#setopt mark_dirs
#setopt multibyte
#setopt nomatch
#setopt null_glob
#setopt numeric_glob_sort
#setopt rc_expand_param
#setopt rematch_pcre
#setopt sh_glob
#setopt unset
#setopt warn_create_global

# history
setopt append_history       # append to history file, rather than replace it
#setopt bang_hist
setopt extended_history     # save beginning timestamps and durtion (seconds)
setopt hist_allow_clobber   # add '|' to output redirections to clobber
setopt hist_beep            # beep when history entry is not there
#setopt hist_expire_dups_first
#setopt hist_fcntl_lock
#setopt hist_find_no_dups
#setopt 

# Input/Output
#unsetopt aliases            # expand aliases
unsetopt clobber            # allow '>' to truncate existing files and 
                            # '>>' to create files.
unsetopt correct            # try to correct the spelling of commands
unsetopt correct_all        # try to correct spelling of all arguments
unsetopt dvorak             # use dvorak keyboard
unsetopt flow_control       # if unset, output flow control via start/stop
                            # characters (^S/^Q) is disabled
#setopt ignore_eof          # do not exit on end-of-file
#setopt interactive_comments

# Job Control
#setopt auto_continue
#setopt auto_resume
unsetopt bg_nice            # run all background jobs at a lower priority
unsetopt hup                # send the HUP signal when the shell exits
unsetopt long_list_jobs     # list jobs in the long format
setopt monitor              # allow job control
setopt notify               # report status of background jobs immediately

# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile

# # --------------------------------------------------------------------
# # Setup Environment Variables
# # --------------------------------------------------------------------
TZ="America/San_Diego"
HISTFILE=$HOME/.zhistory
HISTSIZE=10000
SAVEHIST=100000
HOSTNAME="`hostname`"
PAGER='less'
#LANGUAGE=
LC_ALL='en_US.UTF-8'
LANG='en_US.UTF-8'
LC_CTYPE=C
#DISPLAY=:0

# Magick
export MAGICK_HOME=/usr/local/ImageMagick
export ECLIPSE_HOME=/Applications/eclipse

# MacPort
#export MACPORT_HOME=/opt/local
#export CPPFLAGS="-I${MACPORT_HOME}/include"
#export LDFLAGS="-L${MACPORT_HOME}/lib"

# Mac specific 
if [[ $platform == 'mac' ]]; then
    export EDITOR='vim'
    # MacVim
    if [ -d '/Applications/MacVim' ]; then
        export VIM_APP_DIR=/Applications/MacVim
    else
        export VIM_APP_DIR=/Applications
    fi
    # Wireshark
    if [ -d '/Applications/Wireshark' ]; then
        export WIRESHARK_APP_DIR=/Applications/Wireshark
    fi
else
    export EDITOR='vim'
fi

## Figure out what PATH should be
## Paths are not added if they do not exist
typeset -U common_paths
common_paths=(
  ${path} ${=$(command -p getconf PATH)//:/ } 	
	# what the system thinks PATH should be
	${MACPORT_HOME}/bin ${MACPORT_HOME}/sbin	  # MacPort
	${MAGICK_HOME}/bin                          # ImageMagick
	/opt/wireshark/bin                          # wireshark
  /usr/local/cuda/bin                         # cuda
  /usr/local/mongodb/bin                      # MondoDB
	${HOME}/bin                                 # personal stuff
	/usr/local/bin /usr/local/sbin
  /bin /sbin 
  /usr/bin /usr/sbin
)
unset PATH_tmp
unsetopt NOMATCH
for temp_path in ${common_paths}; do 
  # (u0r^IWt,Ur^IWt) seems to check read/write permissions on the directory and
  # the following command fails if the directory is group writable by the user.
  # Homebrew makes /usr/local/bin group writable and the following command does
  # allow it to be in the path.
	#test -d "${temp_path}"(u0r^IWt,Ur^IWt) && PATH_tmp="${PATH_tmp}${temp_path}:"
  test -d "${temp_path}" && PATH_tmp="${PATH_tmp}${temp_path}:"
done
setopt NOMATCH
export PATH=${PATH_tmp/%:/}
unset common_paths temp_path PATH_tmp

## Figure out what DYLD_LIBRARY_PATH should be...
typeset -U common_paths
export DYLD_LIBRARY_PATH=''
common_paths=(
	# what the system thinks LD_LIBRARY_PATH should be
    #${DYLD_LIBRARY_PATH} ${=$(command -p getconf DYLD_LIBRARY_PATH)//:/ } 	
    ${MAGICK_HOME}/lib                          # ImageMagick
    /usr/local/cuda/lib                         # cuda
)
unset PATH_tmp
unsetopt NOMATCH
for temp_path in ${common_paths}; do 
	test -d "${temp_path}"(u0r^IWt,Ur^IWt) && PATH_tmp="${PATH_tmp}${temp_path}:"
done
setopt NOMATCH
export DYLD_LIBRARY_PATH=${PATH_tmp/%:/}
unset common_paths temp_path PATH_tmp
#export DYLD_LIBRARY_PATH=$MAGICK_HOME/lib:/usr/local/cuda/lib:$DYLD_LIBRARY_PATH

# # --------------------------------------------------------------------
# # Terminal prompt
# # --------------------------------------------------------------------
# Terminal prompt colors
autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
    colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
    (( count = $count + 1 ))
done
PR_NO_COLOR="%{$terminfo[sgr0]%}"

PS1="[$PR_LIGHT_MAGENTA%n$PR_NO_COLOR@$PR_LIGHT_GREEN%U%m%u$PR_NO_COLOR:$PR_LIGHT_RED%2c$PR_NO_COLOR]%(!.#.$) "
#PR_SC=$PR_NO_COLOR$PR_LIGHT_RED
#PR_LC=$PR_NO_COLOR$PR_LIGHT_CYAN
#PS1=$PR_SC"[$PR_LC%n$PR_SC@$PR_LC%m%u$PR_SC:$PR_LC%2c$PR_SC]$PR_LC%(!.#.$) $PR_NO_COLOR"

# VCS branch display on right side
setopt prompt_subst
autoload -Uz vcs_info
#zstyle ':vcs_info:*' actionformats '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
#zstyle ':vcs_info:*' formats       '%F{5}[%F{2}%b%F{5}]%f '
#zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*' actionformats '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       '%F{5}[%F{0}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{0}:%F{0}%r'
zstyle ':vcs_info:*' enable git cvs svn

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$g[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
RPROMPT=$'$(vcs_info_wrapper)'
#RPS1="$PR_LIGHT_MAGENTA(%D{%m-%d %H:%M})$PR_NO_COLOR"

unsetopt ALL_EXPORT     # all parameters subsequenty defined are all exported

# # --------------------------------------------------------------------
# # Tab title
# # --------------------------------------------------------------------
if [[ $platform == 'mac' ]] then
    #precmd () { print -Pn "\e]2;%~\a" } # title bar prompt
    precmd () { print -Pn "\e]2;%2c\a" } # title bar prompt
fi

# # --------------------------------------------------------------------
# # aliases
# # --------------------------------------------------------------------

# Use MacVim's vim - check if we have MacVim ...
if [[ $platform == 'mac' ]] then
    if [ -f '/Applications/MacVim/MacVim.app/Contents/MacOS/Vim' ]; then
        alias vim='/Applications/MacVim/MacVim.app/Contents/MacOS/Vim'
    elif [ -f '/Applications/MacVim.app/Contents/MacOS/Vim' ]; then
        alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
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
    alias ls='ls -F --color=auto'
else 
    alias ls='ls -F'
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

# # --------------------------------------------------------------------
# # Key bindings
# # --------------------------------------------------------------------
# http://www.cs.elte.hu/zsh-manual/zsh_14.html
#
# Bash style keyboard shortcuts
# ctrl-a	go to beginning of the line
# ctrl-e 	go to end of line
# ctrl-l	clear screen
# ctrl-u	clear line before the cursor
# ctrl-h	same as backspace
# ctrl-r	search through previously used commands
# ctrl-w	delete word before cursor
# ctrl-k	clear line after the cursor
# alt-f		move cursor forward one word
# alt-b		move cursor backward one word
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^u' backward-kill-line # delete everything before cursor
bindkey '^k' kill-line # delete everything after cursor
bindkey '^b' kill-word # delete the current word
bindkey '^[f' forward-word # move forward-word
bindkey '^[b' backward-word # move backward-word

bindkey '^r' history-incremental-search-backward
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history
# bindkey "^[[H" beginning-of-line
# bindkey "^[[1~" beginning-of-line
# bindkey "^[[F"  end-of-line
# bindkey "^[[4~" end-of-line
bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand

stty erase ^H &>/dev/null
bindkey "^[[3~" delete-char

#chpwd() {
#     [[ -t 1 ]] || return
#     case $TERM in
#     sun-cmd) print -Pn "\e]l%~\e\\"
#     ;;
#    *xterm*|screen|rxvt|(dt|k|E)term) print -Pn "\e]2;%~\a"
#    ;;
#    esac
#}
#chpwd

# # --------------------------------------------------------------------
# # Code Completion
# # --------------------------------------------------------------------

# Enable completion
autoload -U compinit promptinit
compinit
promptinit

# Improve completion style
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

unsetopt auto_name_dirs
[[ -s "$HOME/.rvm/scripts/rvm" ]] && \. "$HOME/.rvm/scripts/rvm" # Load RVM function