function! s:SetupMarkdownPreview()
    set spell
    map <buffer> <leader>p :Mm <cr>
endfunction

function! s:SetupGitCommit()
    set textwidth=72
    if version >= 703
        set colorcolumn=73
    endif
    " wrap doesn't work in the console for some reason...
    set wrap
    " make sure position is set at the beginning
    call setpos('.', [0, 1, 1, 0])
endfunction

" Set indent spacing to |spaces|
function! SetTabSpace(spaces)
    :execute 'set tabstop='.a:spaces
    :execute 'set shiftwidth='.a:spaces
    :execute 'set softtabstop='.a:spaces
endfunction

" Set indent spacing to |spaces| and reindent the whole page
function! RetabSpaceTo(spaces)
    :execute 'set tabstop='.a:spaces
    :execute 'set shiftwidth='.a:spaces
    :execute 'set softtabstop='.a:spaces
    set expandtab
    normal ggVG=
endfunction

" Generate tags for specific language type
function! GenCtags(type)
    let gen_cmd = g:Tlist_Ctags_Cmd
    if a:type == 'c++'
        let gen_cmd = gen_cmd . ' -R --c++-kinds=+p --fields=+aiS --extra=+q'
    elseif a:type == 'c'
        let gen_cmd = gen_cmd . ' -R --c-kinds=+p --fields=+aiS --extra=+q'
    else
        let gen_cmd = gen_cmd . ' -R'
    endif

    if gen_cmd != g:Tlist_Ctags_Cmd
        echo gen_cmd
        call system(gen_cmd)
    endif
endfunction

function! LoadCTag(tag_name)
    let tag_string = 'tags/' . a:tag_name . '.tags'
    let tfs = split(globpath(&rtp, tag_string),"\n")
    for tf in tfs
        let &tags .= "," . expand(escape(escape(tf, " "), " "))
    endfor
endfunction
