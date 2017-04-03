filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

"-------------
" Essentials |
"-------------

" From vim-scripts
" Fuzzy/partial search for buffer/file/command/etc.
Plugin 'FuzzyFinder'
" Provides utility commands and functions for ???
Plugin 'L9'

" Close buffer utility
Plugin 'toshiroyamada/Kwbd.vim'

" gc/gcc to comment out selection or line
Plugin 'tpope/vim-commentary'
" . command can be used with pluging map
Plugin 'tpope/vim-repeat'

"----------------------------
" Code Check and Cmopletion |
"----------------------------
" Omni-completion using ctags
"Plugin 'vim-scripts/OmniCppComplete'
Plugin 'Shougo/neocomplete.vim'
" TODO: Need better config to search header files in syntastic
Plugin 'scrooloose/syntastic'
" TODO: Need proper compile option and config to use YouCompleteMe
"Plugin 'Valloric/YouCompleteMe'

"----------
" Utility |
"----------
" File tree explorer
Plugin 'scrooloose/nerdtree'
" Visualize git vim undo tree
Plugin 'sjl/gundo.vim'
" Display ctag list
"Plugin 'taglist.vim'
Plugin 'majutsushi/tagbar'
" File/buffer search using ctrl-p
Plugin 'kien/ctrlp.vim'
" Search tool in vim
Plugin 'mileszs/ack.vim'
" Asynchronously dispatch commands such as make
Plugin 'tpope/vim-dispatch'
" Git wrapper
Plugin 'tpope/vim-fugitive'
" Toggle between header and source files
" TODO:
" - doesn't work with C++ files unless file is opened,
" - doesn't work if header/source are in different directory.
Plugin 'vim-scripts/a.vim'

"----------
" Display |
"----------
" Improved status line
"Plugin 'Lokaltog/vim-powerline'
Plugin 'vim-airline/vim-airline'
" Display git change status on left of line number
Plugin 'airblade/vim-gitgutter'
" Syntax highlighting for various languages using ctags
Plugin 'vim-scripts/TagHighlight'

"----------------
" Color Schemes |
"----------------
Plugin 'Lokaltog/vim-distinguished'
Plugin 'altercation/vim-colors-solarized'
" Makes it easy to create color scheme. DO I NEED IT?
"Plugin 'vim-scripts/EasyColour'

"Plugin 'Blackrush/vim-gocode'
"Plugin 'MatlabFilesEdition'
"Plugin 'Pydiction'
"Plugin 'SuperTab-continued.'
"Plugin 'derekwyatt/vim-scala'
"Plugin 'fholgado/minibufexpl.vim'
"Plugin 'flazz/vim-colorschemes' " Includes many color schemes
"Plugin 'ivanov/vim-ipython'
"Plugin 'jnurmine/Zenburn'
"Plugin 'jnwhiteh/vim-golang'
"Plugin 'matthias-guenther/hammer.vim'  " markup lang to HTML
"Plugin 'mattn/zencoding-vim'
"Plugin 'scrooloose/nerdcommenter'
"Plugin 'sophacles/vim-processing'
"Plugin 'tpope/vim-speeddating'
"Plugin 'vim-scripts/compilejsl.vim'

"syntax on
filetype plugin indent on
