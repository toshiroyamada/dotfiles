filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Essentials
Bundle 'FuzzyFinder'
Bundle 'L9'
Bundle 'vim-scripts/EasyColour'
Bundle 'vim-scripts/TagHighlight'

Bundle 'Lokaltog/vim-distinguished'
Bundle 'Lokaltog/vim-powerline'
Bundle 'airblade/vim-gitgutter'
Bundle 'flazz/vim-colorschemes'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'sjl/gundo.vim'
Bundle 'taglist.vim'
Bundle 'toshiroyamada/Kwbd.vim'
Bundle 'toshiroyamada/dwm.vim'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'vim-scripts/a.vim'

" TODO
" Need proper compile option and config to use YouCompleteMe
"Bundle 'Valloric/YouCompleteMe'
" Need better config to search header files in syntastic
"Bundle 'scrooloose/syntastic'

"Bundle 'Blackrush/vim-gocode'
"Bundle 'MatlabFilesEdition'
"Bundle 'Pydiction'
"Bundle 'SuperTab-continued.'
"Bundle 'derekwyatt/vim-scala'
"Bundle 'fholgado/minibufexpl.vim'
"Bundle 'ivanov/vim-ipython'
"Bundle 'jnurmine/Zenburn'
"Bundle 'jnwhiteh/vim-golang'
"Bundle 'matthias-guenther/hammer.vim'  " markup lang to HTML
"Bundle 'mattn/zencoding-vim'
"Bundle 'scrooloose/nerdcommenter'
"Bundle 'sophacles/vim-processing'
"Bundle 'tpope/vim-speeddating'
"Bundle 'vim-scripts/OmniCppComplete'
"Bundle 'vim-scripts/compilejsl.vim'

syntax on
filetype plugin indent on
