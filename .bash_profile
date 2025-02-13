#
# ~/.bash_profile
#

if hash mise 2>/dev/null; then
  eval "$(mise activate zsh)"
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
