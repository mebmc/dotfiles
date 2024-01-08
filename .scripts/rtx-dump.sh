#!/bin/bash

if [[ ! -d "$HOME/.config/rtx" ]]; then mkdir -p "$HOME/.config/rtx"; fi
brew bundle dump --formula --casks --taps --file=- | grep -Ev "^mas " > "$HOME/.config/brew/Brewfile" 2>/dev/null
