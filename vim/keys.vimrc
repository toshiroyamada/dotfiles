" Frequentyly used vim keys cheatsheet
" :noh          Clear highlighted text
" :lcd path     Change local buffer directory
" :cd path      Change buffer directory globally
" Path

" \v: use very magical search (Python/Perl/etc. Reg Exp style)
" Everything except letters, numbers and underscores are special characters
" http://briancarper.net/blog/448/vim-regexes-are-awesome
" \c: ignore case search
nnoremap / /\v
vnoremap / /\v

"========================================
"   Leaders
"========================================

" Open and reload vimrc file
if has("win32")
  nmap <leader>v :sp $HOME\_vimrc<cr><C-w>
  nmap <silent> <leader>V :source $HOME\_vimrc<cr>
else
  nmap <leader>v :sp ~/.vimrc<cr><C-w>
  nmap <silent> <leader>V :source ~/.vimrc<cr>
endif

" Remove trailing spaces
nmap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>

" Change local directory to current file
nmap <leader>c :lcd %:p:h<cr>

" Change all vim directories to current file
nmap <leader>C :cd %:p:h<cr>

" Plugin shortcuts
map <leader>g :GundoToggle<CR>

" YouCompleteMe
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jD :YcmCompleter GoToDefinition<CR>

" NERDTree
map <leader>n :NERDTreeToggle<cr>

" TagList
"map <leader>ll :TlistOpen<cr>
"map <leader>lc :TlistClose<cr>

" Tagbar
map <leader>l :TagbarToggle<cr>

"========================================
"   Function Keys
"========================================
" For inserting current time
noremap <F1> "=strftime("%Y/%m/%d")<CR>P
inoremap <F1> <C-R>=strftime("%Y/%m/%d")<CR>
noremap <F2> "=strftime("%Y/%m/%d %H:%M:%S")<CR>P
inoremap <F2> <C-R>=strftime("%Y/%m/%d %H:%M:%S")<CR>
noremap <F3> "=strftime("%FT%T")<CR>P
inoremap <F3> <C-R>=strftime("%FT%T")<CR>

nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
