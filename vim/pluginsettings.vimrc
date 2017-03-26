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
let g:NERDTreeWinPos='left'
let g:NERDTreeWinSize=40
let g:NERDChristmasTree=1
let g:NERDTreeIgnore=['\.rbc$','\~$','\.o$']

"
" DWM
"
let g:dwm_map_keys = 0

"
" Syntastic
"
let g:syntastic_ignore_files = ['\.py$']
"let g:syntastic_python_checkers = ['flake8']

"
" TagList
"
if has("win32")
    let g:Tlist_Ctags_Cmd = "$HOME\bin\ctags.exe"
elseif has("linux")
    let g:Tlist_Ctags_Cmd = "/usr/bin/ctags"
elseif has("mac")
    "let g:Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
    let g:Tlist_Ctags_Cmd = "${HOME}/homebrew/bin/ctags"
else
    let g:Tlist_Ctags_Cmd = "/usr/bin/ctags"
endif

let g:tlist_cpp_settings = 'c++;n:namespace;v:variable;d:macro;t:typedef;f:function;p:prototype;s:struct'
let g:tlist_c_settings = 'c;d:macro;g:enum;s:struct;u:union;t:typedef;f:function;p:prototype'
let g:Tlist_Compact_Format = 1
let g:TList_Show_Menu = 1
let g:Tlist_Show_One_File = 1
let g:Tlist_WinWidth = 40
let g:Tlist_Display_Prototype = 0
let g:Tlist_Use_Left_Window = 1

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
if executable('ag')
    let g:ctrlp_user_command = 'ag --skip-vcs-ignores --path-to-ignore ~/.agnestignore %s --files-with-matches --nocolor -g ""'
endif
