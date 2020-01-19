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

# # --------------------------------------------------------------------
# # Improve tab completion for git
# # --------------------------------------------------------------------
# http://stackoverflow.com/questions/9810327/git-tab-autocompletion-is-useless-can-i-turn-it-off-or-optimize-it
__git_files () {
    _wanted files expl 'local files' _files
}
