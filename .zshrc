zmodload zsh/zprof
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Setup homebrew path
if [[ -d "/opt/homebrew/bin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory for zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not already installed
if [[ ! -d "${ZINIT_HOME}" ]]; then
    mkdir -p "$(dirname "${ZINIT_HOME}")"
    git clone https://github.com/zdharma-continuum/zinit.git "${ZINIT_HOME}"
fi

# Source/Load Zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k theme
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

zinit light nix-community/nix-zsh-completions

zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::direnv
zinit snippet OMZP::vi-mode
zinit snippet OMZP::command-not-found

zinit load 'zsh-users/zsh-history-substring-search'
zinit ice wait atload'_history_substring_search_config'
HISTORY_SUBSTRING_SEARCH_PREFIXED=1

# Load completions
autoload -U compinit && compinit
zinit cdreplay -q

# Custom completions
fpath=($HOME/.completions.d $fpath)

# Use vi keybindings
bindkey -v
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true
VI_MODE_CURSOR_NORMAL=2
VI_MODE_CURSOR_VISUAL=4
VI_MODE_CURSOR_INSERT=6
VI_MODE_CURSOR_OPPEND=0
VI_MODE_INSERT_ESCAPE_BINDKEY=jk
bindkey -M viins 'jk' vi-cmd-mode

# Keybindings
bindkey '^y' autosuggest-accept
bindkey '^[[B' history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^R'   atuin-search-viins

bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line
bindkey '^[[3~' delete-char
bindkey -M vicmd '^[[1~' beginning-of-line
bindkey -M vicmd '^[[4~' end-of-line
bindkey -M vicmd '^[[3~' delete-char

bindkey -M vicmd 'j' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'Esc Esc' sudo-command-line
bindkey -M viins 'Esc Esc' sudo-command-line

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#606060,bold,underline"

# History
HISTSIZE=20000
HISTFILE=~/.zsh_history
SAVEHIST=20000
HISTDUP=erase
setopt appendhistory
# setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion settings
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Shell interations
eval "$(mise activate zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(atuin init zsh --disable-up-arrow --disable-ctrl-r)"

# Add zshrc user config
source ${HOME}/.zshrc_user

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
