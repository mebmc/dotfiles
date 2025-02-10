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
    export HOMEBREW_NO_AUTO_UPDATE="true"
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
zinit snippet OMZP::gpg-agent

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
setopt extendedhistory
# setopt sharehistory
setopt inc_append_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_reduce_blanks

# 1password
function _set_1password_agent() {
  if [[ -d "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/" ]]; then
    export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
  elif [[ -d "$HOME/.1password/" ]]; then
    export SSH_AUTH_SOCK="$HOME/.1password/agent.sock"
  elif [[ -d "/mnt/c/Windows/System32/OpenSSH/" ]]; then
    # TODO: Improve Windows WSL support
    # alias ssh="/mnt/c/Windows/System32/OpenSSH/ssh.exe"
    # alias ssh-add="/mnt/c/Windows/System32/OpenSSH/ssh-add.exe"
  # else
  #   echo "Failed to find 1password SSH"
  fi
}

function _load_op_plugins(){
  if ((${+commands[op]})) && [[ ! -e "$OP_PLUGIN_ALIASES_SOURCED" ]]; then
    if [[ -f "$HOME/.config/op/plugins.sh" ]]; then
      . ~/.config/op/plugins.sh
    fi
  fi
}

if [[ -z "${SSH_CLIENT}" ]]; then
  _set_1password_agent
fi
_load_op_plugins

# Completion settings
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --icons --color=always $realpath'
zstyle ':fzf-tab:complete:ls:argument*' fzf-preview 'eza -1 --icons --color=always $realpath'
zstyle ':fzf-tab:complete:nvim:argument*' fzf-preview 'eza -1 --icons --color=always $realpath'
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}'
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
zstyle ':fzf-tab:complete:tldr:argument-1' fzf-preview 'tldr --color always $word'
 # zstyle ':fzf-tab:complete:-command-:*' fzf-preview '(out=$(tldr --color always "$word") 2>/dev/null && echo $out) || (out=$(MANWIDTH=$FZF_PREVIEW_COLUMNS man "$word") 2>/dev/null && echo $out) || (out=$(which "$word") && echo $out) || echo "${(P)word}"'
zstyle ':fzf-tab:complete:yadm-(add|diff|restore):*' fzf-preview 'yadm diff $word | delta'
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview 'git diff $word | delta'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview 'git log --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview 'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
	'case "$group" in
	"commit tag") git show --color=always $word ;;
	*) git show --color=always $word | delta ;;
	esac'
zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
	'case "$group" in
	"modified file") git diff $word | delta ;;
	"recent commit object name") git show --color=always $word | delta ;;
	*) git log --color=always $word ;;
	esac'

zstyle ':fzf-tab:complete:*:options' fzf-preview
zstyle ':fzf-tab:complete:*:argument-1' fzf-preview
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:*' popup-min-size 120 8

# Shell interations

eval "$(fzf --zsh)"

if hash mise 2>/dev/null; then
  eval "$(mise activate zsh)"
fi

if hash direnv 2>/dev/null; then
  eval "$(direnv hook zsh)"
fi

if hash atuin 2>/dev/null; then
  eval "$(atuin init zsh --disable-up-arrow --disable-ctrl-r)"
fi

# Add zshrc user config
source ${HOME}/.zshrc_user

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(zoxide init --cmd cd zsh)"
