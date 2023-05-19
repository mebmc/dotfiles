# A simple plugin to mimic vim copy registers.
#
# This was written by/with ChatGPT as an experiment.
#

# Default register
register_default="default"

# Store location and compression settings
store_location="${R_STORE_LOCATION:-$HOME/.local/share/r}"
disable_compression="${R_DISABLE_COMPRESSION:-false}"
disable_prompt="${R_DISABLE_PROMPT:-true}"
random_length="${R_RANDOM_LENGTH:-32}"

# Function to validate register name
validate_register_name() {
    if [[ "$1" =~ [^a-zA-Z0-9@:%\.\+] ]]; then
        printf "Invalid register name. Only alphanumeric characters and '@', '%%', ':', '.', '+' are allowed.\n"
        return 1
    fi
    return 0
}

# Shift the numbered registers
function shift_registers() {
    for i in {10..0}; do
        prev=$(($i-1))
        [ -e "$store_location/register_$prev.gz" ] && mv "$store_location/register_$prev.gz" "$store_location/register_$i.gz"
    done
    [ -e "$store_location/register_last.gz" ] && cp -f "$store_location/register_last.gz" "$store_location/register_0.gz"
}

# Command without space
function r() {
    local register="${1:-$register_default}"
    local register_file="$store_location/register_$register"

    [ ! -d "$store_location" ] && ( mkdir -p "$store_location" || { echo "Cannot create directory $store_location"; return 1; })

    # Check for list, clean, or help commands
    if [[ "$register" == "help" ]]; then
        printf "Usage:\n"
        printf "  r <register>               Print the content of <register>\n"
        printf "  r list                     List all current registers\n"
        printf "  r clean [<age>]            Remove registers older than <age> days (default 30)\n"
        printf "  r.                         Use the last register\n"
        printf "  r%%                         Return the current path\n"
        printf "  r:                         Return the last command used\n"
        printf "  r@                         Generate a secure random string\n"
        printf "  <command> | r <register>   Save the output of <command> to <register>\n"
        return
    elif [[ "$register" == "list" ]]; then
        printf "Current registers:\n"
        ls "$store_location" | grep -o 'register_.*.gz' | cut -d'_' -f 2 | cut -d'.' -f 1
        return
    elif [[ "$register" == "clean" ]]; then
        local age="${2:-30}"
        find "$store_location" -name 'register_*.gz' -mtime +$age -exec rm -f {} \;
        printf "Cleaned up registers older than %s days.\n" "$age"
        return
    elif [[ "$register" == "." ]]; then
        # The content of the last register used
        register="$register_last_used"
    elif [[ "$register" == "%%" ]]; then
        # The current path
        printf "%s\n" "$PWD"
        return
    elif [[ "$register" == ":" ]]; then
        # The last command used
        fc -ln -1
        return
    elif [[ "$register" == "@" ]]; then
        # A secure random string
        LC_ALL=C </dev/urandom tr -dc 'A-Za-z0-9' | head -c"$random_length"
        return
    fi

    validate_register_name "$register" || return

    register_file="$store_location/register_$register"
    register_last_used="$store_location/register_last"

    if [[ -p /dev/stdin ]]; then
        # There is a pipe input, save it to the register
        if [[ "$1" == "+" ]]; then
            # System clipboard
            if [[ "$(uname)" == "Darwin" ]]; then
                # macOS
                pbcopy
            else
                # Assume Linux
                xclip -selection clipboard
            fi
            printf "Content saved to system clipboard.\n"
        else
            if [[ "$disable_compression" == "true" ]]; then
                cat > "$register_file"
                [ -e "$register_file" ] && rm -f "$register_last_used" && cp "$register_file" "$register_last_used"
                # printf "Content saved to register '%s'.\n" "$register"
            else
                gzip -c > "$register_file.gz"
                [ -e "$register_file.gz" ] && rm -f "$register_last_used.gz" && cp "$register_file.gz" "$register_last_used.gz"
                # printf "Content saved to register '%s' (compressed).\n" "$register"
            fi
            shift_registers
        fi
    else
        # No pipe input, output the register content
        if [[ "$1" == "+" ]]; then
            # System clipboard
            if [[ "$(uname)" == "Darwin" ]]; then
                # macOS
                pbpaste
            else
                # Assume Linux
                xclip -selection clipboard -o
            fi
        elif [[ -f "$register_file.gz" ]]; then
            if [[ "$disable_compression" == "true" ]]; then
                cat "$register_file"
            else
                gunzip -c "$register_file.gz"
            fi
        fi
    fi
}

# Automatically save the output of the last command, unless disabled
if [[ "$disable_prompt" != "true" ]]; then
    export PROMPT_COMMAND='if [ -n "${_temp_output+x}" ]; then rm -f $_temp_output; unset _temp_output; fi; _temp_output=$(mktemp); exec > >(tee $_temp_output); r < $_temp_output'
fi

