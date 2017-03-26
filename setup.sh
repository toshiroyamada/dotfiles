#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ${DIR}

relpath=$(python -c "import os.path; print os.path.relpath('${DIR}', '${HOME}')")


# Setup git config
git config user.name "Toshiro Yamada"
git config user.email "toshiroyamada@users.noreply.github.com"

echo "Link files"
for conf in vim vimrc zsh zshrc zshenv tmux.conf; do
    echo ln -s "${relpath}/$conf" "${HOME}/.$conf"
    ln -s "${relpath}/$conf" "${HOME}/.$conf"
done

echo "Create swap, backup and undo folders"
mkdir -p ~/.vim/{backup,swap,undo}

echo Install vundle
mkdir ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo Install vim bundles
vim +BundleInstall +qall

# Setup tmux plugin
# Run prefix + I in tmux to install plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo Ready. Now compile YouCompleteMe: http://valloric.github.com/YouCompleteMe/

# On Linux, we need to install the following dependencies
# sudo apt-get install build-essential git cmake python-dev
