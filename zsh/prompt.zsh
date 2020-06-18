# # --------------------------------------------------------------------
# # Terminal prompt
# # --------------------------------------------------------------------
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
DIR=$(dirname $(realpath "${BASH_SOURCE:-$0}"))

setopt ALL_EXPORT

# Terminal prompt colors
autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
    colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
    (( count = $count + 1 ))
done
PR_NO_COLOR="%{$terminfo[sgr0]%}"

# TIME [USERNAME@HOST:PATH] $
PS1="$PR_LIGHT_CYAN%D %*$PR_NO_COLOR [$PR_LIGHT_MAGENTA%n$PR_NO_COLOR@$PR_LIGHT_GREEN%U%m%u$PR_NO_COLOR:$PR_LIGHT_RED%1c$PR_NO_COLOR]%(!.#.$) "

# TIME [PATH] $
#PS1="$PR_LIGHT_CYAN%D %*$PR_NO_COLOR [$PR_LIGHT_RED%1c$PR_NO_COLOR]%(!.#.$) "

source $DIR/prompt-vcs.zsh

unsetopt ALL_EXPORT
