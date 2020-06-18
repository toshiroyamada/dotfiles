Toshiro's dotfiles
==================

General Setup
-------------

* Create symbolic links:

        ln -s tmux.conf ~/.tmux.conf
        ln -s vimrc ~/.vimrc
        ln -s zshenv ~/.zshenv
        ln -s zshrc ~/.zshrc

Vim Vundle Setup
----------------

* Create necessary directories

        mkdir vim/bundle
        mkdir -p ~/.vim/{backup,swap,undo}

* Donwload vundle

        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

* Install plugins using vundle

        vim +PluginInstall +qall

Vim YCM Setup
-------------

* Compile YouCompleteMe plugin (http://valloric.github.com/YouCompleteMe/)

         # Need to install CMake first
         sudo apt-getinstall cmake

         cd ~/.vim/bundle/YouCompleteMe
         ./install.sh --clang-completer

Vim on Linux
------------

* Compile Vim from source on Ubuntu

        sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
            libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
            libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial
        hg clone https://code.google.com/p/vim/
        cd vim
        ./configure --with-features=huge \
                    --enable-multibyte \
                    --enable-rubyinterp \
                    --enable-pythoninterp \
                    --with-python-config-dir=/usr/lib/python2.7/config \
                    --enable-perlinterp \
                    --enable-luainterp \
                    --enable-gui=gtk2 --enable-cscope --prefix=${HOME}/opt
        make VIMRUNTIMEDIR=${HOME}/opt/share/vim/vim74
        make install
