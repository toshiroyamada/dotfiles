" if exists("did_load_filetypes")
"     finish
" endif

augroup json
    au! BufRead,BufNewFile *.json setfiletype json
augroup END

au BufRead,BufNewFile *.{mkd,md,markdown} setfiletype mkd
