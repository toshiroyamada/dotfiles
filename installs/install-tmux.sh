#!/bin/bash
if [ $(uname -s) = "Darwin" ]; then
    brew install tmux
else
    OPTDIR=${HOME}/opt
    SRCDIR=${OPTDIR}/src

    mkdir -p ${OPTDIR} ${SRCDIR}

    # Install ncurses
    sudo apt-get install -y libncurses5-dev

    # Install libevent
    cd ${SRCDIR}
    wget https://sourceforge.net/projects/levent/files/libevent/libevent-2.0/libevent-2.0.22-stable.tar.gz
    tar xzf libevent-2.0.22-stable.tar.gz
    cd libevent-2.0.22-stable
    ./configure --prefix=${OPTDIR} --disable-shared
    make
    make install

    # Install tmux
    cd ${SRCDIR}
    wget http://downloads.sourceforge.net/tmux/tmux-1.9a.tar.gz
    tar xzf tmux-1.9a.tar.gz
    cd tmux-1.9a

    ./configure --enable-static  --prefix=${OPTDIR} \
        CFLAGS="-I${OPTDIR}/include" LDFLAGS="-L${OPTDIR}/lib" \
        LIBEVENT_CFLAGS="-I${OPTDIR}/incude" LIBEVENT_LIBS="-L${OPTDIR}/lib -levent"
    make -j5
    make install
fi
