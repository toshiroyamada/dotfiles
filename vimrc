let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
execute "source " . s:path . "/vim/general.vimrc"
execute "source " . s:path . "/vim/functions.vimrc"
execute "source " . s:path . "/vim/vundle.vimrc"
execute "source " . s:path . "/vim/pluginsettings.vimrc"
execute "source " . s:path . "/vim/autocommands.vimrc"
execute "source " . s:path . "/vim/keys.vimrc"
execute "source " . s:path . "/vim/ui.vimrc"
