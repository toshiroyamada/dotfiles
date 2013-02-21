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
