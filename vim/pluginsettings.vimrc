"
" YouCompleteMe
"
let g:ycm_key_detailed_diagnostics=''
if has("mac")
    " Use the system python since I compile YouCompleteMe with this version
    let g:ycm_path_to_python_interpreter='/usr/bin/python'
endif
" Close the annoying preview window when done
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_confirm_extra_conf=0

"
" nerdtree
"
let g:NERDTreeWinPos = 'left'
let g:NERDTreeWinSize = 50
let g:NERDChristmasTree = 1
let g:NERDTreeIgnore = ['\.rbc$','\~$','\.o$']
let g:NERDTreeShowLineNumbers = 1

"
" Syntastic
"
" Recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_ignore_files = ['\.py$']
"let g:syntastic_python_checkers = ['flake8']

"
" Set my ctags binary
"
if has("win32")
    if fileradable("${HOME}\bin\ctags.exe")
        let g:myctags = "${HOME}\bin\ctags.exe"
    endif
elseif has("mac")
    if fileradable("${HOME}/homebrew/bin/ctags")
        let g:myctags = "${HOME}/homebrew/bin/ctags"
    endif
endif

if !exists("g:myctags")
    if filereadable("/usr/local/bin/ctags")
        let g:myctags = "/usr/local/bin/ctags"
    elseif filereadable("/usr/bin/ctags")
        let g:myctags = "/usr/bin/ctags"
    endif
endif

"
" TagList
"
let g:Tlist_Ctags_Cmd = g:myctags
let g:tlist_cpp_settings = 'c++;n:namespace;v:variable;d:macro;t:typedef;f:function;p:prototype;s:struct'
let g:tlist_c_settings = 'c;d:macro;g:enum;s:struct;u:union;t:typedef;f:function;p:prototype'
let g:Tlist_Compact_Format = 1
let g:TList_Show_Menu = 1
let g:Tlist_Show_One_File = 1
let g:Tlist_WinWidth = 40
let g:Tlist_Display_Prototype = 0
let g:Tlist_Use_Left_Window = 1

"
" Tagbar
"
let g:tagbar_left = 1
let g:tagbar_width = 40

"
" Ack
"
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

"
" CtrlP
"
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_extensions = ['tag', 'buffertag']
let g:ctrlp_regexp = 1
let g:ctrlp_match_window = 'buttom,order:btt,min:1,max:20,results:20'
if exists("${HOME}/.tyconfig/vim/ctrlp.vim")
    source ${HOME}/.tyconfig/vim/ctrlp.vim
else
    if executable('ag')
        let g:ctrlp_user_command = 'ag %s --files-with-matches --nocolor -g ""'
    endif
endif

"
" Solarized color scheme
"
let g:solarized_termcolors=256
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"

"
" vim-airline
"
let g:airline#extensions#tabline#enabled = 1

