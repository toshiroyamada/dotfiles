#!/usr/bin/env bash -e

#
# Changes font size of IDEA
#
SIZE=$1

if [ -z "$SIZE" ]; then
    echo "Specify font size as an argument"
    exit 1
fi

OPTIONS_DIR="$HOME/Library/Application Support/JetBrains/IdeaIC2020.1/options/"
if [ ! -d "$OPTIONS_DIR" ]; then
    echo "IDEA options directory doesn't exist: $OPTIONS_DIR"
    exit 1
fi

echo "Changing size to $SIZE"

echo "editor.xml"
sed -i.bak -E \
    "s/<option name=\"FONT_SIZE\" value=\"[^\"]+\" \/>/<option name=\"FONT_SIZE\" value=\"$SIZE\" \/>/" \
    "$OPTIONS_DIR/editor.xml"

echo "other.xml"
sed -i.bak -E \
    "s/<option name=\"fontSize\" value=\"[^\"]+\" \/>/<option name=\"fontSize\" value=\"$SIZE\" \/>/" \
    "$OPTIONS_DIR/other.xml"

