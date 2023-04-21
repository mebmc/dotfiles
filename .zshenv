# Locale

export LANG="en_GB.UTF-8"
export LC_COLLATE="en_GB.UTF-8"
export LC_CTYPE="en_GB.UTF-8"
export LC_MESSAGES="en_GB.UTF-8"
export LC_MONETARY="en_GB.UTF-8"
export LC_NUMERIC="en_GB.UTF-8"
export LC_TIME="en_GB.UTF-8"
export LC_ALL="en_GB.UTF-8"

# Path

export PATH="$HOME/.local/bin:/opt/homebrew/bin:$HOME/linux/bin:$HOME/go/bin:$HOME/.cargo/bin:$HOME/.npm-packages/bin:/usr/local/bin:$PATH"

# Base

export EDITOR="nvim"
export PAGER="less"

# Extra

export TZ_LIST="Europe/London;US/Central;US/Eastern;US/Pacific"

export XDG_CONFIG_HOME="$HOME/.config"
export ICLOUD="$HOME/Library/Mobile\ Documents/com\~apple\~CloudDocs"

export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"

export NAVI_CONFIG="$HOME/.navi.yaml"


if [[ -f "$HOME/.zshenv_private" ]]; then
  source "$HOME/.zshenv_private"
fi
