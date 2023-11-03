# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH="$HOME/.scripts:$HOME/.nix-profile/bin:$HOME/.local/bin:/opt/homebrew/bin:$HOME/linux/bin:$HOME/go/bin:$HOME/.cargo/bin:$HOME/.npm-packages/bin:$HOME/.ghcup/bin/:/usr/local/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.config/oh-my-zsh

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  1password
  aliases
  ansible
  argocd
  brew
  command-not-found
  common-aliases
  copypath
  copyfile
  cp
  direnv
  docker-compose
  docker
  dotenv
  encode64
  extract
  fzf
  git
  github
  gitignore
  gpg-agent
  helm
  history
  httpie
  kubectl
  macos
  # magic-enter
  mosh
  nix-shell
  nmap
  node
  nodenv
  npm
  pip
  pipenv
  pre-commit
  profiles
  pyenv
  python
  rbenv
  redis-cli
  ripgrep
  ruby
  rust
  safe-paste
  ssh-agent
  sublime-merge
  sublime
  taskwarrior
  terraform
  tmux
  urltools
  vagrant
  vault
  vi-mode
  virtualenv
  vscode
  wakeonlan
  web-search
  yii

# Custom plugins
  1password-extra
  register
  zsh-syntax-highlighting
  zsh-vi-mode

  # load last
  history-substring-search
)

# Plugin options

zstyle :omz:plugins:ssh-agent lazy yes
zstyle :omz:plugins:ssh-agent lifetime 8h

function zvm_config() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

  zvm_bindkey vicmd 'j' history-substring-search-down
  zvm_bindkey vicmd 'k' history-substring-search-up
}

# Source oh-my-zsh

source $ZSH/oh-my-zsh.sh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^R'   _atuin_search

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_GB.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Set TMUX session vars
tmux_running=$(pgrep tmux)
if [[ -n $TMUX ]] && [[ -n $tmux_running ]]; then
  TMUX_SESSION_NAME=$(tmux display-message -p "#{session_name}")
  TMUX_SESSION_ID=$(tmux display-message -p "#{session_id}")
  TMUX_SESSION_PATH=$(tmux display-message -p "#{session_path}")
  TMUX_SESSION_CREATED=$(tmux display-message -p "#{session_created}")
  export TMUX_SESSION_NAME
  export TMUX_SESSION_ID
  export TMUX_SESSION_PATH
  export TMUX_SESSION_CREATED
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Add zshrc user
source ${HOME}/.zshrc_user

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
