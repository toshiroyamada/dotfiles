#!/bin/bash
set -e

LIBEVENT_VERSION=2.0.22-stable
TMUX_VERSION=2.1

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
    LIBEVENT_DIR=libevent-${LIBEVENT_VERSION}
    if [ ! -d "${LIBEVENT_DIR}" ]; then
        wget https://sourceforge.net/projects/levent/files/libevent/libevent-2.0/libevent-${LIBEVENT_VERSION}.tar.gz
        tar xzf libevent-${LIBEVENT_VERSION}.tar.gz
        cd "${LIBEVENT_DIR}"
        ./configure --prefix=${OPTDIR} --disable-shared
        make
        make install
    else
        echo "${LIBEVENT_DIR} already exists!"
    fi

    # Install tmux
    cd ${SRCDIR}
    TMUX_DIR=tmux-${TMUX_VERSION}
    if [ ! -d "${TMUX_DIR}" ]; then
        wget https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz
        tar xzf tmux-${TMUX_VERSION}.tar.gz
        cd "${TMUX_DIR}"

        ./configure --enable-static  --prefix=${OPTDIR} \
            CFLAGS="-I${OPTDIR}/include" LDFLAGS="-L${OPTDIR}/lib" \
            LIBEVENT_CFLAGS="-I${OPTDIR}/incude" LIBEVENT_LIBS="-L${OPTDIR}/lib -levent"
        make -j5
        make install
    else
        echo "${TMUX_DIR} already exists!"
    fi
fi
