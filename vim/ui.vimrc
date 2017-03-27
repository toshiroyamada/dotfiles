syntax on
"set cursorcolumn           " highlight the current column
"set cursorline             " highlight current line

" Enable 256-bit color
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
    set t_Co=256
endif

" Fix Background Color Erase issue when running in tmux
" See https://sunaku.github.io/vim-256color-bce.html
if &term =~ '256color'
    set t_ut=
endif

set background=dark
"colorscheme distinguished
colorscheme solarized

if has("gui_running")
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

    set guioptions-=T     " remove toolbar
    set guioptions-=m     " remove menubar
    set guioptions-=e     " remove GUI tab option
    set guioptions-=rRlL  " remove scrollbars
else
    " Fix terminal timeout when pressing escape
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        autocmd InsertEnter * set timeoutlen=0
        autocmd InsertLeave * set timeoutlen=1000
    augroup END
endif

" Set listchars "eol" and "extends" to use BOLD font
highlight NonText gui=bold
" Set listchars "nbsp", "tab", and "trail" to use BOLD font
highlight SpecialKey gui=bold
