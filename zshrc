######################################################################
#
#      Toshiro's zshrc file
#
######################################################################
# .zshrc is symbolically linked to this file. Get the directory to this file.
# ${(%)-%N} does prompt expansion on the literal string "%N". %N is the name of
# the script.

# Mac doesn't come with realpath, so define a similar function here.
# Taken from https://stackoverflow.com/a/18443300
command realpath >/dev/null 2>&1 || realpath() {
  local OURPWD=$PWD
  cd "$(dirname "$1")"
  local LINK=$(readlink "$(basename "$1")")
  while [ "$LINK" ]; do
    cd "$(dirname "$LINK")"
    LINK=$(readlink "$(basename "$1")")
  done
  local REALPATH="$PWD/$(basename "$1")"
  cd "$OURPWD"
  echo "$REALPATH"
}
DIR=$(dirname $(realpath ${(%):-%N}))

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
