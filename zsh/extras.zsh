#
# Load extra initialization files that are not in .zshrc
#
for file in ${0:a:h}/extras/*.zsh; do
#    if [ -e ${0:a:h}/$file ]; then
#        source ${0:a:h}/$file
#    fi
    if [ -e $file ]; then
        source $file
    fi
done
