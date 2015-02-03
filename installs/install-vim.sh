#!/bin/bash

OPTDIR=${HOME}/opt
SRCDIR=${OPTDIR}/src

sudo apt-get install -y \
    libncurses5-dev \
    libgnome2-dev \
    libgnomeui-dev \
    libgtk2.0-dev \
    libatk1.0-dev \
    libbonoboui2-dev \
    libcairo2-dev \
    libx11-dev \
    libxpm-dev \
    libxt-dev \
    python-dev \
    ruby-dev \
    mercurial \
    checkinstall

# sudo apt-get remove vim vim-runtime gvim vim-tiny vim-common vim-gui-common

mkdir ${OPTDIR} ${SRCDIR}

cd ${SRCDIR}

hg clone https://code.google.com/p/vim/
cd vim
./configure --with-features=huge \
    --enable-multibyte \
    --enable-rubyinterp \
    --enable-pythoninterp \
    --with-python-config-dir=/usr/lib/python2.7/config \
    --enable-perlinterp \
    --enable-luainterp \
    --enable-gui=gtk2 \
    --enable-cscope \
    --prefix=${OPTDIR}
make VIMRUNTIMEDIR=${OPTDIR}/share/vim/vim74
make install
