#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ${DIR}

relpath=$(python -c "import os.path; print os.path.relpath('${DIR}', '${HOME}')")

# Setup git config
git config user.name "Toshiro Yamada"
git config user.email "toshiroyamada@users.noreply.github.com"

echo "Link files"
for conf in vimrc ideavimrc zshrc zshenv tmux.conf; do
    echo ln -s "${relpath}/$conf" "${HOME}/.$conf"
    ln -s "${relpath}/$conf" "${HOME}/.$conf"
done

echo "Create swap, backup and undo folders"
mkdir -p ~/.vim/{backup,swap,undo}

echo Install vundle
mkdir ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo Install vim bundles
vim +PluginInstall +qall

# Setup tmux plugin
# Run prefix + I in tmux to install plugins
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

system_name="$(uname -s)"
if [ "$system_name" = "Darwin" ]; then
    if ! command -v brew &> /dev/null; then
        echo "Installing Homebrew"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    fi
    echo "Installing vim"
    brew install vim
    echo "Installing tmux"
    brew install tmux
    echo "Installing reattach-to-user-namespace for clipboard sharing in tmux"
    brew install reattach-to-user-namespace

    echo 'For Zsh compinit warning: compaudit | xargs chmod g-w'
elif [ "$system_name" = "Linux" ]; then
    # On Linux, we need to install the following dependencies
    sudo apt-get install build-essential git cmake python-dev
fi

# echo Ready. Now compile YouCompleteMe: http://valloric.github.com/YouCompleteMe/
