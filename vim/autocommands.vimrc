" Omnicomplete functions
autocmd FileType c setlocal omnifunc=ccomplete#Complete
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

"autocmd BufRead,BufNewFile *.{mkd,md,markdown} call s:SetupMarkdownPreview()
autocmd BufRead,BufNewFile *.plist setlocal noexpandtab shiftwidth=8 tabstop=8 softtabstop=8
autocmd BufRead,BufNewFile *.{scala,sbt} setlocal syntax=scala
autocmd BufRead,BufNewFile *.ino setlocal filetype=arduino
autocmd BufRead,BufNewFile *.proto setlocal shiftwidth=2 tabstop=2 softtabstop=2
"autocmd BufWritePost *.py call Flake8()

"autocmd FileType gitcommit call s:SetupGitCommit()
autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType matlab setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType objc setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType scala setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType make setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4

" GZip files
augroup gzip
    autocmd BufReadPre     *.GZ setlocal bin
    autocmd BufRead        *.GZ call gzip#read("gzip -dn")
    autocmd BufWritePost   *.GZ call gzip#write("gzip")
    autocmd FileAppendPost *.GZ call gzip#write("gzip")
    autocmd FileAppendPre  *.GZ call gzip#appre("gzip -dn")
    autocmd FileReadPost   *.GZ call gzip#read("gzip -dn")
    autocmd FileReadPre    *.GZ setlocal bin
    autocmd FileWritePost  *.GZ call gzip#write("gzip")
augroup END

" Prevent fold from opening when inserting unbalanced bracket
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
