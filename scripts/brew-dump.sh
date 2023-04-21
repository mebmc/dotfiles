#!/bin/bash

if [[ ! -d "$HOME/.config/brew" ]]; then mkdir -p "$HOME/.config/brew"; fi
brew bundle dump --formula --casks --taps --file=- | grep -Ev "^mas " > "$HOME/.config/brew/Brewfile" 2>/dev/null
