# Add Nix and Brew to Path

export PATH="$HOME/.nix-profile/bin:/opt/homebrew/bin:/opt/homebrew/opt/coreutils/libexec/gnubin:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:/mnt/c/Windows/System32/OpenSSH:$HOME/.local/bin:$HOME/.scripts:$HOME/go/bin:$HOME/.cargo/bin:$HOME/.npm-packages:$HOME/.ghcup/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Locale

export LANG="en_GB.UTF-8"
export LC_COLLATE="en_GB.UTF-8"
export LC_CTYPE="en_GB.UTF-8"
export LC_MESSAGES="en_GB.UTF-8"
export LC_MONETARY="en_GB.UTF-8"
export LC_NUMERIC="en_GB.UTF-8"
export LC_TIME="en_GB.UTF-8"
export LC_ALL="en_GB.UTF-8"

# Locale hijack for remote sessions

export LC_BASH_MODE="vim"

# Base

export EDITOR="nvim"
export PAGER="bat --style=plain"

export ZK_NOTEBOOK_DIR="$HOME/git/notes"

# Secrets

export SOPS_AGE_KEY_FILE="$XDG_CONFIG_HOME/sops/personal.agekey"
export SOPS_AGE_RECIPIENTS="age1phjmatzsug76d2u6tqgf2l7s9a5tmv9splu43j05qxnj6cexxvtspv770g"

# Search

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# Themes

export BAT_THEME="Catppuccin-mocha"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# DevOps

export ANSIBLE_DIFF_ALWAYS=true
export ANSIBLE_FORCE_COLOR=true

# Docker

export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# NodeJS

export NODE_OPTIONS="--max-old-space-size=12288"

# Mojo

if [[ -d "$HOME/.modular" ]]; then
  export MODULAR_HOME="$HOME/.modular"
  export PATH="$HOME/.modular/pkg/packages.modular.com_mojo/bin:$PATH"
fi

# Extra

export CC="/usr/bin/gcc"
export TZ_LIST="Europe/London;US/Central;US/Eastern;US/Pacific"

export XDG_CONFIG_HOME="$HOME/.config"
export ICLOUD="$HOME/Library/Mobile\ Documents/com\~apple\~CloudDocs"

export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"

export NAVI_CONFIG="$HOME/.navi.yaml"

export AICHAT_CONFIG_DIR="$HOME/.config/aichat"

if [[ -f "$HOME/.zshenv_private" ]]; then
  source "$HOME/.zshenv_private"
fi

if [[ -f "$HOME/.zshenv_personal" ]]; then
  source "$HOME/.zshenv_personal"
fi

if [[ -f "$HOME/.zshenv_work" ]]; then
  source "$HOME/.zshenv_work"
fi
