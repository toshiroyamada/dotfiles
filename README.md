Toshiro's dotfiles
==================

Setting up vim
--------------

* symlink vim to ~/.vim and vimrc to ~/.vimrc

        ln -s vim ~/.vimrc
        ln -s vimrc ~/.vimrc

* Create necessary directories

        mkdir vim/bundle
        mkdir -p ~/.vimlocal/{backup,swap,undo}

* Donwload vundle

        cd vim/bundle
        git clone https://github.com/gmarik/vundle.git

* Install plugins using vundle

        vim +BundleInstall +qall

* Compile YouCompleteMe plugin (http://valloric.github.com/YouCompleteMe/)

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
