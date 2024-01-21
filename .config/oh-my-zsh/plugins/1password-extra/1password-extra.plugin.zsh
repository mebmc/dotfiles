# https://developer.1password.com/docs/ssh/agent/compatibility#ssh-auth-sock
#
function _set_1password_agent() {
  if [[ -d "$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/" ]]; then
    export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
  elif [[ -d "$HOME/.1password/" ]]; then
    export SSH_AUTH_SOCK="$HOME/.1password/agent.sock"
  elif [[ -d "/mnt/c/Windows/System32/OpenSSH/" ]]; then
    # TODO: Improve Windows WSL support
    # alias ssh="/mnt/c/Windows/System32/OpenSSH/ssh.exe"
    # alias ssh-add="/mnt/c/Windows/System32/OpenSSH/ssh-add.exe"
  else
    echo "Failed to find 1password SSH"
  fi
}

function _load_op_plugins(){
  if ((${+commands[op]})) && [[ ! -e "$OP_PLUGIN_ALIASES_SOURCED" ]]; then
    . ~/.config/op/plugins.sh
  fi
}

if [[ -z "${SSH_CLIENT}" ]]; then
  _set_1password_agent
fi
_load_op_plugins
