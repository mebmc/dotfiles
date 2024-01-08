#!/usr/bin/env bash

languages=$(echo "rust lua go python javascript typescript scala java haskell elixir" | tr ' ' '\n')
core_utils=$(echo "grep just xargs find mv sed awk rp zellij yadm yabai skhd tr jq date fzf" | tr ' ' '\n')

selected=$(printf "%s\n%s" "$languages" "$core_utils" | fzf --reverse --height 40% --border)
read -rp "query: " query

if printf "%s" "$languages" | grep -qs "$selected"; then
    echo "searching for '$query' in '$selected'"
    curl "cht.sh/$selected/$(echo $query | tr ' ' '+')"
else
    echo "searching for '$query' in '$selected'"
    curl "cht.sh/$selected~$query"
fi

