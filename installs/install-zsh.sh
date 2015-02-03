#!/bin/bash

OPTDIR=${HOME}/opt
SRCDIR=${OPTDIR}/src

mkdir -p ${OPTDIR} ${SRCDIR}

cd ${SRCDIR}
wget http://sourceforge.net/projects/zsh/files/zsh/5.0.7/zsh-5.0.7.tar.gz
tar xzf zsh-5.0.7.tar.gz
cd zsh-5.0.7

./configure --prefix=${OPTDIR}
make
make install
