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

## Changing directories
setopt autocd               # cd without typing cd
setopt autopushd            # automatically pushd the old directory
unsetopt cdable_vars        # expand cd argument as if it was preceded by '~'
unsetopt chase_dots         # resolve sym links when using '..' in path
unsetopt chase_links        # resolve sym links. include effect of chase_dots
setopt pushd_ignore_dups    # don't push multiple copies of same directories
setopt pushdminus           # exchanges meanings of '+' & '-' when used with
                            # number to specify a directory in the stack
setopt pushdsilent          # Don't print directory stack after pushd or popd

## Completion
#unsetopt always_last_prompt # return to last prompt if given no numeric argument
#setopt always_to_end        # move cursor to the end of word after completion
#unsetopt auto_list          # automatically list choices
unsetopt auto_menu          # automatically use menu completition after 2nd tab
#setopt auto_name_dirs       # ??? (shouldn't be set)
#unsetopt auto_param_keys    # delete space if param key inserted
#unsetopt auto_param_slash   # add slash after directory name completion
#unsetopt auto_remove_slash  # if next typed is word delimiter, remove slash
#setopt bash_auto_list       # list choicoes when hit tab twice in succession.
                            # takes precedence over auto_list
#setopt complete_aliases     # prevent aliases from substituted before completion
#setopt complete_in_word     # if unset, put cursor to the end of the word if
                            # completion is started
setopt glob_complete        # match with glob pattern
#unsetopt hash_list_all      # hash cmd path whenever cmd completion is attempt
#unsetopt list_ambiguous     # autolisting only when nothing would be inserted
#unsetopt list_beep          # beep on an ambiguous completion
#setopt list_packed          # completion list less lines, varying column widths
#setopt list_rows_first      # layout matches sorted horizontally
#unsetopt list_types         # show type of each file with identifying mark
#setopt menu_complete        # insert the first completion list
#setopt rec_exact            # recognize exact matches even if they're ambiguous

## Expansion and Globbing
#unsetopt bad_pattern        # print error if pattern is badly formed
#unsetopt bare_glob_qual
#setopt brace_ccl            # expand expressions in braces
#unsetopt case_glob          # make globbing sensitive to case
#unsetopt case_match         # make regular expressions sensitive to case
#setopt csh_null_glob
#unsetopt equals             # perform = filname expansion
#setopt extended_glob       # use '#', '~', and '^' as part of patterns
#unsetopt glob               # perform filename generation
#setopt glob_assign
setopt glob_dots            # do not require leading '.' in a filename
#setopt glob_subst
#setopt hist_subst_pattern
#setopt ignore_braces
#setopt ksh_glob
#setopt magic_equal_subst
#setopt mark_dirs
#unsetopt multibyte          # respect multibyte characters found in strings
#unsetopt nomatch            # print error if a pattern has no matches
#setopt null_glob
#setopt numeric_glob_sort
#setopt rc_expand_param
#unsetopt rematch_pcre       # regex matching =~ will use PCRE
#setopt sh_glob
#unsetopt unset              # treat unset parameters as if empty
#setopt warn_create_global

## History
#unsetopt append_history     # append to history file, rather than replace it
#unsetopt bang_hist          # perform textual history expansion
setopt extended_history     # save beginning timestamps and durtion (seconds)
setopt hist_allow_clobber   # add '|' to output redirections to clobber
#unsetopt hist_beep          # beep when history entry is not there
#setopt hist_expire_dups_first
#setopt hist_fcntl_lock
#setopt hist_find_no_dups
#setopt hist_ignore_all_dups
#setopt hist_ignore_dups
#setopt hist_ignore_space
#setopt hist_no_functions
#setopt hist_no_store
#setopt hist_reduce_blanks
#unsetopt hist_save_by_copy
#setopt hist_save_no_dups
#setopt hist_verify
#setopt inc_append_history
#setopt share_history

## Input/Output
#unsetopt aliass            # expand aliases
unsetopt clobber            # allow '>' to truncate existing files and
                            # '>>' to create files.
#setopt correct              # try to correct the spelling of commands
#setopt correct_all          # try to correct spelling of all arguments
#setopt dvorak               # use dvorak keyboard
unsetopt flow_control       # if unset, output flow control via start/stop
                            # characters (^S/^Q) is disabled
#setopt ignore_eof          # do not exit on end-of-file
#setopt interactive_comments
#unsetopt hash_cmds
#unsetopt hash_dirs
#setopt mail_warning
#setopt path_dirs
#setopt print_eight_bit
#setopt print_exit_value     # print exit value of programs with non-zero exit
#setopt rc_quotes
#setopt rm_star_silent       # don't ask before executing 'rm *' or 'rm path/*'
#setopt rm_star_wait         # wait 10 seconds before querying above rm cmd
#unsetopt short_loops        # allow short forms of for, repeat, select, if and
                            # functions constructs
#setopt sun_keyboard_hack    # ignore trailing backquote if uneven

## Job Control
#setopt auto_continue
#setopt auto_resume
unsetopt bg_nice            # run all background jobs at a lower priority
#unsetopt check_jobs         # report status of background and suspended jobs
                            # before exiting shell with job control
#unsetopt hup                # send the HUP signal when the shell exits
#setopt long_list_jobs       # list jobs in the long format
setopt monitor              # allow job control
#unsetopt notify             # report status of background jobs immediately

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
HISTSIZE=1000000
SAVEHIST=1000000
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

## TMUX 256-color
if (($+TMUX)); then
    export TERM=screen-256color
fi

## Figure out what PATH should be
## Paths are not added if they do not exist
typeset -U common_paths

# Remove /bin /usr/bin and /usr/bin/local from default path
# so we can override the order
default_path=(${path} ${=$(command -p getconf PATH)//:/ })
default_path=${default_path:gs/\/usr\/local\/bin//}
default_path=${default_path:gs/\/usr\/local\/sbin//}
default_path=${default_path:gs/\/usr\/bin//}
default_path=${default_path:gs/\/usr\/sbin//}
default_path=${default_path:gs/ \/bin//}
default_path=${default_path:gs/ \/sbin//}
# Split string by space
default_path=(${(s: :)default_path})

common_paths=(
    # what the system thinks PATH should be
    ${HOME}/bin                                 # personal stuff
    ${HOME}/homebrew/bin
    ${HOME}/Code/scripts
    ${HOME}/Dev/scripts
    ${HOME}/opt/bin
    ${default_path}
    /usr/local/bin /usr/local/sbin
    /usr/bin /usr/sbin
    /bin /sbin
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

PS1="$PR_LIGHT_CYAN%DT%*$PR_NO_COLOR [$PR_LIGHT_MAGENTA%n$PR_NO_COLOR@$PR_LIGHT_GREEN%U%m%u$PR_NO_COLOR:$PR_LIGHT_RED%1c$PR_NO_COLOR]%(!.#.$) "
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
zstyle ':vcs_info:*' formats       '%F{5}[%F{4}%b%F{5}]%f '
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

# # --------------------------------------------------------------------
# # Key bindings
# # --------------------------------------------------------------------
# http://www.cs.elte.hu/zsh-manual/zsh_14.html

# vi mode
bindkey -v

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
#bindkey '^a' beginning-of-line
#bindkey '^e' end-of-line
#bindkey '^u' backward-kill-line # delete everything before cursor
#zle -N bash-backward-kill-word
#bindkey '^w' bash-backward-kill-word
#bindkey '^k' kill-line # delete everything after cursor
#bindkey '^[f' forward-word # move forward-word
#bindkey '^[b' backward-word # move backward-word

bindkey '^r' history-incremental-search-backward
bindkey '^f' history-incremental-search-forward
bindkey "^[[A" up-line-or-history
bindkey "^[[B" down-line-or-history
#bindkey "^[[5~" up-line-or-history
#bindkey "^[[6~" down-line-or-history
# bindkey "^[[H" beginning-of-line
# bindkey "^[[1~" beginning-of-line
# bindkey "^[[F"  end-of-line
# bindkey "^[[4~" end-of-line
bindkey ' ' magic-space    # also do history expansion on space
#bindkey '^I' complete-word # complete on tab, leave expansion to _expand

#stty erase ^H &>/dev/null
#bindkey "^[[3~" delete-char

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
# Disable hostname completion
# zstyle ':completion:*' hosts off
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

#unsetopt auto_name_dirs
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && \. "$HOME/.rvm/scripts/rvm" # Load RVM function


# # --------------------------------------------------------------------
# # Improve tab completion for git
# # --------------------------------------------------------------------
# http://stackoverflow.com/questions/9810327/git-tab-autocompletion-is-useless-can-i-turn-it-off-or-optimize-it
__git_files () {
    _wanted files expl 'local files' _files
}

# # --------------------------------------------------------------------
# # Sourcing extra setups
# # --------------------------------------------------------------------
if [[ -e ~/.zsh/work ]]; then
    source ~/.zsh/work
fi

if [[ -e ~/.zsh/display_preexec ]]; then
    source ~/.zsh/display_preexec
fi
