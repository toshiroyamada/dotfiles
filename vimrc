" Toshiro's vimrc file
" 2014/04/28

" Basics {
  set nocompatible " explicitly get out of vi-compatible mode
  set noexrc " don't use local version of .(g)vimrc, .exrc
" }

" Functions {
  function! s:SetupMarkdownPreview()
    set spell
    map <buffer> <leader>p :Mm <cr>
  endfunction

  function! s:SetupTextEdit()
    "set spell
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

  " Set the development window for |size| pages and open NERDTree and Tag
  " List panes. Usually |size| is 1 or 2 to support single page or dual page
  " editing. On my MacBook Pro with 1680x1050 resolution, I can open two
  " pages perfectly.
  function! DevWindow(size)
    :NERDTreeClose
    :TlistClose
    let &columns = 84*a:size + a:size + g:Tlist_WinWidth
    " Also set the window height to maximum when using MacVim
    if has("gui_macvim")
      let &lines = 100
    endif
    :NERDTree
    :Tlist
    echo
  endfunction

  " Close NERDTree and Tag List panes.
  function! DevClose()
    :NERDTreeClose
    :TlistClose
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
" }

" Commands {
  " Commands to setup my Vim windows
  command! -nargs=0 -bar C1 set columns=84
  command! -nargs=0 -bar C2 set columns=169
  command! -nargs=0 -bar D1 call DevWindow(1)
  command! -nargs=0 -bar D2 call DevWindow(2)
  command! -nargs=0 -bar DC call DevClose()
  command! -nargs=1 -bar LoadTag call LoadCTag(<q-args>)
" }

" General {
  set nospell " no spell check
  set history=150 " keep 150 lines of command line history
  set backup " make backup files
  if has("win32")
    set backupdir=$HOME\vimlocal\backup " where to put backup files
    set directory=$HOME\vimlocal\swap " where to put swap files
  else
    set backupdir=~/.vimlocal/backup " where to put backup files
    set directory=~/.vimlocal/swap " where to put swap files
  endif
  set clipboard+=unnamedplus " share windows clipboard
  set hidden " change buffer without saving
  set visualbell " use visual beeps
  set wildmenu " turn on command line completion wild style
  " ignore these list of file extensions
  set wildignore+=*.dll,*.o,*.obj,*.git,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png,*rbc
  set wildmode=list:longest,list:full
  set laststatus=2 " always display the status line
  set ttyfast " smoother redraw
  "set lazyredraw " don't redraw when running macros

  if version >= 703
    set autochdir " always switch to the current file directory
    set undofile " persistent undo with an undofile
    if has("win32")
      set undodir=$HOME\vimlocal\undo
    else
      set undodir=$HOME/.vimlocal/undo
    endif
  endif

  if has('win')
    set shellslash
  endif

  " set grep to always generate a file-name
  set grepprg=grep\ -nH\ $*

  set mousehide " hide mouse after char typed
" }

" Vim UI {
  "set cursorcolumn " highlight the current column
  "set cursorline " highlight current line
  if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
    set t_Co=256
  endif
" }

" Text Formatting/Layout {
  " Set tab to space of 4
  set tabstop=8
  set shiftwidth=4
  set softtabstop=4
  set expandtab

  if has('breakindent')
    set breakindent
    set showbreak=..
  endif

  if has("multi_byte")
    if &termencoding == ""
      lef &termencoding = &encoding
    endif
    scriptencoding utf-8
    set encoding=utf-8
    setglobal fileencoding=utf-8
    set fileencoding=utf-8
  endif

  "set linebreak " don't break words
  set scrolloff=2 " keep n lines above and below the cursor if possible
  set autoindent
  set showmode " display current editing status
  set showcmd	" display incomplete commands
  set ruler " show the cursor position all the time
  set wrap " wrap text
  set t_kb=

  " allow backspacing over everything in insert mode
  set backspace=indent,eol,start

  if version >= 703
    set relativenumber " use relative line number
  else
    set nu " Display line number
  endif

  " For handling long lines
  set textwidth=79
  set formatoptions=qrn1
  if version >= 703
    "set colorcolumn=81
  endif
  " highlight the text that's over 80 characters
  "highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  "match OverLength /\%81v.\+/

  " Folding
  "set nofoldenable
  set foldenable " Turn on folding
  set foldmethod=indent " Fold on the marker
  set foldlevel=100 " Don't autofold anything (but I can still fold manually)
  set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds

  set listchars=trail:·,precedes:«,extends:»,tab:▸\ ,eol:↲
" }


" Search and moving {
  " Search case-insensitive when string is all-lowercase.
  " If string contains at least one uppercase, search case-sensitive.
  set ignorecase
  set smartcase

  " Do incremental searching.
  " CTRL-L to insert next character from the match
  " CTRL-R CTRL-W to complete the current matching word
  set incsearch

  set hlsearch " highlight search terms
  set showmatch
  set nowrapscan " don't wrap around

  " Apply subsititions globally on lines
  " :%s/foo/bar/ instead of :%s/foo/bar/g
  "set gdefault
" }

" Vundle {
  filetype off

  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()

  Bundle 'gmarik/vundle'

  " Github repos
  "Bundle 'Lokaltog/powerline'  " doesn't work
  "Bundle 'fholgado/minibufexpl.vim'
  "Bundle 'ivanov/vim-ipython'
  "Bundle 'jnurmine/Zenburn'
  "Bundle 'matthias-guenther/hammer.vim'  " markup lang to HTML
  "Bundle 'mattn/zencoding-vim'
  "Bundle 'msanders/cocoa.vim'
  "Bundle 'nvie/vim-flake8'
  "Bundle 'pangloss/vim-javascript'
  "Bundle 'sophacles/vim-processing'
  "Bundle 'tpope/vim-rails'
  "Bundle 'tpope/vim-speeddating'
  "Bundle 'tpope/vim-surround'
  "Bundle 'tristen/vim-sparkup' " similar to zencoding
  Bundle 'Blackrush/vim-gocode'
  Bundle 'Lokaltog/vim-distinguished'
  Bundle 'Lokaltog/vim-powerline'
  Bundle 'Valloric/YouCompleteMe'
  Bundle 'airblade/vim-gitgutter'
  Bundle 'derekwyatt/vim-scala'
  Bundle 'flazz/vim-colorschemes'
  Bundle 'jnwhiteh/vim-golang'
  Bundle 'jpalardy/vim-slime'
  Bundle 'kien/ctrlp.vim'
  Bundle 'mileszs/ack.vim'
  Bundle 'scrooloose/nerdcommenter'
  Bundle 'scrooloose/nerdtree'
  Bundle 'scrooloose/syntastic'
  Bundle 'sjl/gundo.vim'
  Bundle 'toshiroyamada/Kwbd.vim'
  Bundle 'toshiroyamada/dwm.vim'
  Bundle 'tpope/vim-commentary'
  Bundle 'tpope/vim-dispatch'
  Bundle 'tpope/vim-fugitive'
  Bundle 'tpope/vim-repeat'

  " vim-scripts repos
  "Bundle 'MatlabFilesEdition'
  "Bundle 'Pydiction'
  "Bundle 'SuperTab-continued.'
  "Bundle 'tComment'
  "Bundle 'vim-scripts/OmniCppComplete'
  "Bundle 'vim-scripts/compilejsl.vim'
  Bundle 'FuzzyFinder'
  Bundle 'L9'
  Bundle 'taglist.vim'
  Bundle 'vim-scripts/EasyColour'
  Bundle 'vim-scripts/TagHighlight'
  Bundle 'vim-scripts/a.vim'

  syntax on
  filetype plugin indent on
" }


" GUI {
  if has("gui_running")
    " colo[rscheme]
    "  * wombat - dark bg, red variable name
    "  * mustang - dark bg, bold white function
    "  * midnight - dark bg, good for low light environment
    "  * molokai - dark bg, pink keyword
    "  * macvim - white bg, default macvim color
    "  * distinguished - dark bg, 256-color
    "  * warm_grey
    "  * lightcolors
    colorscheme distinguished

    " Set font according to system
    if has("mac")
      set linespace=1
      set guifont=Consolas:h12
      "set guifont=Menlo:h11
      "set guifont=Monaco:h12
    elseif has('win32') || has('win64')
      set linespace=0
      set guifont=Consolas:h11
    elseif has("unix")
      set linespace=1
      set guifont=DejaVu\ Sans\ Mono\ Book\ 8.6
    elseif has("linux")
      set linespace=1
      set guifont=DejaVu\ Sans\ Mono\ Book\ 8.6
      set guioptions+=ag
    endif

    " MacVim options
    "set transparency=5

    set guioptions-=T     " remove toolbar
    set guioptions-=m     " remove menubar
    set guioptions-=e     " remove GUI tab option
    set guioptions-=rRlL  " remove scrollbars
  else
    colorscheme distinguished

    " Fix terminal timeout when pressing escape
    set ttimeoutlen=10
    augroup FastEscape
      autocmd!
      autocmd InsertEnter * set timeoutlen=0
      autocmd InsertLeave * set timeoutlen=1000
    augroup END
  endif
" }

" Mappings {
  " Make tab key match bracket pairs
  "nnoremap <tab> %
  "vnoremap <tab> %

  " Use very magical search (Python/Perl/etc. Reg Exp style)
  " Everything except letters, numbers and underscores are special characters
  " http://briancarper.net/blog/448/vim-regexes-are-awesome
  nnoremap / /\v
  vnoremap / /\v

  " Move by screen line rather than file line
  "nnoremap j gj
  "vnoremap j gj
  "nnoremap k gk
  "vnoremap k gk

  " <leader> {
    "let mapleader=","
    nmap <leader><space> :noh<cr> " clear highlighted text

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

    " Plugin shortcuts
    nmap <leader>a :A<cr>
    map <leader>g :GundoToggle<CR>
  " }

  " Window {
    " Create a new vertical split. Disable in favor of dwm.vim.
    "map <C-w>n <C-w>v<C-w>l

    " Window navigation. Disable when using dwm.vim.
    "map <C-h> <C-w>h
    "map <C-j> <C-w>j
    "map <C-k> <C-w>k
    "map <C-l> <C-w>l
  " }

  " Tab {
    "map <leader>tn :tabnew<cr>
    "map <leader>te :tabedit<cr>
    "map <leader>tc :tabclose<cr>
    "map gt :tabnext<cr>
    "map gT :tabprev<cr>
  " }

  " For inserting current time
  noremap <F1> "=strftime("%Y/%m/%d")<CR>P
  inoremap <F1> <C-R>=strftime("%Y/%m/%d")<CR>
  noremap <F2> "=strftime("%Y/%m/%d %H:%M:%S")<CR>P
  inoremap <F2> <C-R>=strftime("%Y/%m/%d %H:%M:%S")<CR>
  noremap <F3> "=strftime("%FT%T")<CR>P
  inoremap <F3> <C-R>=strftime("%FT%T")<CR>

  " Replace :bd with :Kwbd
  cnoremap <expr> bd (getcmdtype() == ':' ? 'Kwbd' : 'bd')
" }

" Autocommands {
  " To avoid loading autocmd twice when resourced
  "autocmd!

  " Save file when out of focus
  "autocmd FocusLost * :wa

  " Omnicomplete functions
  "autocmd FileType python set omnifunc=pythoncomplete#Complete
  "autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  "autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  "autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  "autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
  "autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  "autocmd FileType c set omnifunc=ccomplete#Complete

  " Syntax
  autocmd BufRead,BufNewFile *.{mkd,md,markdown} call s:SetupMarkdownPreview()
  autocmd BufRead,BufNewFile *.txt call s:SetupTextEdit()
  autocmd BufNewFile,BufRead *.ino setlocal ft=arduino
  "autocmd BufWritePost *.py call Flake8()

  " Git-commit textwidth wrapper
  autocmd FileType gitcommit call s:SetupGitCommit()

  " Tabs
  autocmd BufRead *.plist setlocal shiftwidth=8 tabstop=8 softtabstop=8 noexpandtab
  autocmd FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
  autocmd FileType matlab setlocal shiftwidth=4 tabstop=4 softtabstop=4
  autocmd FileType objc setlocal expandtab shiftwidth=2 softtabstop=2
  autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4

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
" }

" plugins {
  " TagList {
    map <leader>ll :TlistOpen<cr>
    map <leader>lc :TlistClose<cr>
    if has("win32")
      let g:Tlist_Ctags_Cmd = "$HOME\bin\ctags.exe"
    elseif has("linux")
      let g:Tlist_Ctags_Cmd = "/usr/bin/ctags"
    elseif has("mac")
      let g:Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
    else
      let g:Tlist_Ctags_Cmd = "/usr/bin/ctags"
    endif
    let g:tlist_cpp_settings = 'c++;n:namespace;v:variable;d:macro;t:typedef;f:function;p:prototype;s:struct'
    let g:tlist_c_settings = 'c;d:macro;g:enum;s:struct;u:union;t:typedef;f:function;p:prototype'
    let g:Tlist_Compact_Format = 1
    let g:TList_Show_Menu  =1
    let g:Tlist_Show_One_File = 1
    let g:Tlist_WinWidth = 40
    let g:Tlist_Display_Prototype = 0
    let g:Tlist_Use_Left_Window = 1
    "let g:Tlist_Use_Right_Window = 0

    " store tags generated by ctags in $VIM/tags with an extension like *.tags
    set tags=tags;./tags;/ " ctag all the way up to root
    "let s:tfs=split(globpath(&rtp, "tags/*.tags"),"\n")
    "for s:tf in s:tfs
    "    let &tags.=",".expand(escape(escape(s:tf, " "), " "))
    "endfor
  " }

  " NERDTree {
    map <leader>nn :NERDTree<cr>
    map <leader>nc :NERDTreeClose<cr>
    let g:NERDTreeWinPos='left'
    let g:NERDTreeWinSize=40
    let g:NERDChristmasTree=1
    let g:NERDTreeIgnore=['\.rbc$','\~$','\.o$']
    "set winfixwidth
  " }

  " dwm.vim {
    let g:dwm_map_keys = 0
    nmap <C-N> :DWMNew<cr>
    nmap <C-Q> :DWMClose<cr>
    nmap <C-H> :DWMFocus<cr>
    nmap <C-L> :DWMFull<cr>
    nmap <C-J> <C-W>w<cr>
    nmap <C-K> <C-W>W<cr>
  " }

  " YouCompleteMe {
    nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
    nnoremap <leader>jD :YcmCompleter GoToDefinition<CR>
    nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
    let g:ycm_key_detailed_diagnostics=''
    if has("mac")
      " You the system python since I compile YouCompleteMe with this version
      let g:ycm_path_to_python_interpreter='/usr/bin/python'
    endif
    " Close the annoying preview window when done
    let g:ycm_autoclose_preview_window_after_completion=0
    let g:ycm_autoclose_preview_window_after_insertion=1
    let g:ycm_confirm_extra_conf=1
  " }

  " vim-processing {
    let g:processing_doc_style='local'
    "let g:processing_doc_path='file:///Applications/Processing.app/Contents/Resources/Java/modes/java/reference/'
    let g:processing_doc_path='/Applications/Processing.app/Contents/Resources/Java/modes/java/reference/'
  " }

  " Pydiction {
  "let g:pydiction_location='~/.vim/bundle/pydiction-1.2/complete-dict'
  " }

  " Syntastic {
    let g:syntastic_python_checkers = ['flake8']
  " }
" }
