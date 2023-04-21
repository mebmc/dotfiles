#!/bin/bash

if [[ -f "$HOME/.config/brew/Brewfile" ]]; then
  # cd "$HOME/.config/brew/" && brew bundle;
  brew bundle install --no-upgrade --brews --casks --taps --file="$HOME/.config/brew/Brewfile";
else
  echo "No Brewfile";
fi
