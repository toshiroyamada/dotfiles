" .vimrc
" Toshiro Yamada (updated Aug. 23, 2012)

" Basics {
    set nocompatible " explicitly get out of vi-compatible mode
    set noexrc " don't use local version of .(g)vimrc, .exrc
    syntax on " turn on syntax highlighting
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

" Commands
  " Shurt commands to setup my Vim windows
  command! -nargs=0 -bar C1 set columns=84
  command! -nargs=0 -bar C2 set columns=169
  command! -nargs=0 -bar D1 call DevWindow(1)
  command! -nargs=0 -bar D2 call DevWindow(2)
  command! -nargs=0 -bar DC call DevClose()
  command! -nargs=1 -bar LoadTag call LoadCTag(<q-args>)
" }

" General {
    filetype off
    call pathogen#helptags() " generate help files
    call pathogen#runtime_append_all_bundles() " setup Pathogen
    filetype indent plugin on " load filetype plugins/indent settings

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
    set clipboard+=unnamed " share windows clipboard
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
" }

" Vim UI {
if has("gui_running")
    set cursorcolumn " highlight the current column
    set cursorline " highlight current line
endif
" }

" Text Formatting/Layout {
    " Set tab to space of 2
    set tabstop=2
    set shiftwidth=2
    set softtabstop=2
    set expandtab

    if has('breakindent')
      set breakindent
      set showbreak=..
    endif

    autocmd FileType objc setlocal expandtab shiftwidth=2 softtabstop=2

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
    set scrolloff=3 " keep n lines above and below the cursor if possible
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

    set foldmethod=indent
    set nofoldenable

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
    "set nowrapscan " don't wrap around

    " Apply subsititions globally on lines
    " :%s/foo/bar/ instead of :%s/foo/bar/g
    "set gdefault
" }

" GUI {
if has("gui_running")
    " colo[rscheme]
    "  * wombat - dark bg, red variable name
    "  * mustang - dark bg, bold white function
    "  * midnight - dark bg, good for low light environment
    "  * molokai - dark bg, pink keyword
    "  * macvim - white bg, default macvim color
    "
    colorscheme wombat

    " Set font according to system
    if has("mac")
        set linespace=1
        set guifont=Consolas:h12
        "set guifont=Menlo:h11
        "set guifont=Monaco:h12
    elseif has('win32') || has('win64')
        set linespace=0
        colorscheme macvim
        set guifont=Consolas:h11
    elseif has("unix")
        set linespace=1
        set guifont=DejaVu\ Sans\ Mono\ 9
    elseif has("linux")
        set linespace=1
        set guifont=DejaVu\ Sans\ Mono\ 9
    endif

    " MacVim options
    "set transparency=5

    set guioptions-=T     " remove toolbar
    set guioptions-=m     " remove menubar
    set guioptions-=e     " remove GUI tab option
    set guioptions-=rRlL  " remove scrollbars

    "set lines=55
    "set columns=85
else
    colorscheme desert
    set bg=dark " use with dark background color
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
        let mapleader=","
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
        map <leader>nn :NERDTree<cr>
        map <leader>nc :NERDTreeClose<cr>
        map <leader>ll :TlistOpen<cr>
        map <leader>lc :TlistClose<cr>
        "nnoremap <silent> <leader>f <Plug>VimroomToggle
    " }

    " Window {
        " Create a new vertical split. Disable when using dwm.vim.
        "map <C-w>n <C-w>v<C-w>l

        " Window navigation. Disable when using dwm.vim.
        "map <C-h> <C-w>h
        "map <C-j> <C-w>j
        "map <C-k> <C-w>k
        "map <C-l> <C-w>l
    " }

    " Tab {
        map <leader>tn :tabnew<cr>
        map <leader>te :tabedit<cr>
        map <leader>tc :tabclose<cr>
        "map gt :tabnext<cr>
        "map gT :tabprev<cr>
    " }

    " Replace :bd with :Kwbd
    cnoremap <expr> bd (getcmdtype() == ':' ? 'Kwbd' : 'bd')
" }

" Autocommands {
    " Save file when out of focus
    "autocmd FocusLost * :wa

    " Omnicomplete functions
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP
    autocmd FileType c set omnifunc=ccomplete#Complete

    " Syntax
    autocmd BufRead,BufNewFile *.{mkd,md,markdown} call s:SetupMarkdownPreview()
    autocmd BufRead,BufNewFile *.txt call s:SetupTextEdit()

    " Git-commit textwidth wrapper
    autocmd FileType gitcommit call s:SetupGitCommit()

    " Tabs
    autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4
    autocmd FileType matlab setlocal shiftwidth=4 tabstop=4 softtabstop=4
" }

" plugins {
  " TagList {
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
    let g:NERDTreeWinPos='right'
    let g:NERDTreeWinSize=24
    let g:NERDChristmasTree=1
    let g:NERDTreeIgnore=['\.rbc$','\~$','\.o$']
    "set winfixwidth
  " }

  " dwm.vim {
    let g:dwm_map_keys = 0
    nmap <C-N> :DWMNew<cr>
    nmap <C-C> :DWMClose<cr>
    nmap <C-H> :DWMFocus<cr>
    nmap <C-L> :DWMFull<cr>
    nmap <C-J> <C-W>w<cr>
    nmap <C-K> <C-W>W<cr>
  " }

  " bufExplorer {
    let g:bufExplorerShowRelativePath = 1
  " }

  " miniBufExplorer {
    let g:miniBufExplSplitBelow = 1
    let g:miniBufExplSplitToEdge = 1
    let g:miniBufExplMapCTabSwitchBufs = 1
    let g:miniBufExplMapCTabSwitchWindows = 0
    let g:miniBufExplCheckDupeBufs = 1
    let g:miniBufExplorerMoreThanOne = 0
    let g:miniBufExplMapWindowNav = 0
    let g:miniBufExplMapWindowNavVim = 0
    let g:miniBufExplorerAutoUpdate = 1
  " }

  " vim-ragtag {
    let g:ragtag_global_maps = 1
  " }

  " YankRing {
    " Disable some of the keyboard shortcuts
    let g:yankring_replace_n_nkey = ''
    let g:yankring_replace_n_pkey = ''
  " }

  " xiki {
    "let $XIKI_DIR = "/Users/toshiro/.xiki"
    "source /Users/toshiro/.xiki/etc/vim/xiki.vim
  " }
" }
