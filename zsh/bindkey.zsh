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

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

