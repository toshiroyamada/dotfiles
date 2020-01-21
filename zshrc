######################################################################
#
#      Toshiro's zshrc file
#
######################################################################
# .zshrc is symbolically linked to this file. Get the directory to this file.
# ${(%)-%N} does prompt expansion on the literal string "%N". %N is the name of
# the script.
# realpath doesn't exist on MacOS so this is a replacement function
realpath() {
  local CURPWD=$(pwd)
  cd $(dirname "$1")
  local link=$(readlink "$(basename "$1")")
  while [ "$link" ]; do
    cd $(dirname "$link")
    local link=$(readlink "$(basename "$link")")
  done
  echo "$(pwd -P)/$(basename "$1")"
  cd "$CURPWD"
}
DIR=$(dirname "$(realpath "${(%):-%N}")")

ZSHCONFIG=$DIR/zsh
configs=(options.zsh
         completion.zsh
         bindkey.zsh
         env.zsh
         path.zsh
         prompt.zsh
         alias.zsh
         extras.zsh)
for config in $configs; do
    [ -f "$ZSHCONFIG/$config" ] && source "$ZSHCONFIG/$config"
done

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
