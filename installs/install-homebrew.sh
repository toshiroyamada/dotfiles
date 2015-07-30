#!/bin/bash
# Install homebrew in home directory
if [ $(uname -s) = "Darwin" ]; then
    cd ~
    mkdir homebrew && curl -L https://github.com/Homebrew/homebrew/tarball/master | tar xz --strip 1 -C homebrew
fi
