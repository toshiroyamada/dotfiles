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
setopt always_to_end        # move cursor to the end of word after completion
#unsetopt auto_list          # automatically list choices
#unsetopt auto_menu          # automatically use menu completition after 2nd tab
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
