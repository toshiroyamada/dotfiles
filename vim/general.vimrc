set nocompatible            " explicitly get out of vi-compatible mode
set noexrc                  " don't use local version of .(g)vimrc, .exrc

"
" General
"
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set backup                  " make backup files
set clipboard=unnamed       " Alias unnamed register to the * register
set foldenable              " Turn on folding
set foldmethod=indent       " Fold determined by syntax file
"set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds
"set foldopen=hor,mark,percent,quickfix,tag,undo " what movements open folds
set hidden                  " change buffer without saving
set history=100             " keep 100 lines of command line history
set laststatus=2            " always display the status line
set lazyredraw              " don't redraw when running macros
set list                    " Display
set listchars=tab:▸\ ,trail:·,extends:»,precedes:«,nbsp:.
set number                  " display line number
set ruler                   " show the cursor position all the time
set tags=tags;./tags;/      " ctag all the way up to root
set t_kb=                 " Fix backspace not working on Linux?
set ttyfast                 " smoother redraw
set visualbell              " use visual beeps
set wildignore+=*.dll,*.o,*.obj,*.git,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png,*rbc
set wildmenu                " Turn on command line completion wild style
set wildmode=list:longest   " Act like shell completion


" Mouse configuration
set mouse=a
set mousehide               " hide mouse after char typed

if version >= 703
    "set autochdir           " always switch to the current file directory
    set relativenumber      " use relative line number
    set undofile            " persistent undo with an undofile
endif

" Directories
if has("win32")
    set backupdir=$HOME\vim\backup
    set directory=$HOME\vim\swap
    set spellfile=$HOME\vim\en.utf-8.add
    if version >= 703
        set undodir=$HOME\vim\undo
    endif
else
    set backupdir=~/.vim/backup
    set directory=~/.vim/swap
    set spellfile=~/.vim/en.utf-8.add
    if version >= 703
        set undodir=$HOME/.vim/undo
    endif
endif

"
" Text and format
"

" Set default tab space. This is overwritten based on file type. See autocommands.vimrc
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set autoindent
set wrap                    " wrap text
if has('breakindent')
    set breakindent         " indent wrapped text
    set showbreak=..        " characters to show when breakindent
endif
set textwidth=79            " Break long line after white space
set formatoptions=qrn1      " See fo-table

if has("multi_byte")
    scriptencoding utf-8
    set encoding=utf-8
    setglobal fileencoding=utf-8
    set fileencoding=utf-8
    if &termencoding == ""
        lef &termencoding = &encoding
    endif
endif

"
" Search and moving
"
"set ignorecase                  " Search case-insensitive when string is all-lowercase.
set smartcase                   " If string contains at least one uppercase, search case-sensitive.
set incsearch                   " Do incremental searching.
set hlsearch                    " highlight search terms
set showmatch
set nowrapscan                  " don't wrap around
