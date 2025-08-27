#!/bin/bash

# Universal command wrapper that prefixes commit messages with [WIP] when using --no-verify
# Usage: wrapper-script <command> [args...]
# Example: wrapper-script git commit --no-verify -m "message"

# Extract the command
command="$1"
shift

# Check if we have at least one argument (the command)
if [[ $# -eq 0 ]]; then
    "$command"
fi

echo "$command"

# Check if we have --no-verify and -m flags
has_no_verify=false
has_message_flag=false
message=""
other_args=()

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --no-verify)
            has_no_verify=true
            other_args+=("$1")
            shift
            ;;
        -m|--message)
            has_message_flag=true
            other_args+=("$1")
            if [[ $# -gt 1 ]]; then
                message="$2"
                shift 2
            else
                echo "Error: -m flag requires a message argument"
                exit 1
            fi
            ;;
        -m*)
            # Handle -m"message" format
            has_message_flag=true
            message="${1#-m}"
            other_args+=("-m")
            shift
            ;;
        *)
            other_args+=("$1")
            shift
            ;;
    esac
done

# If both --no-verify and -m are present, prefix the message with [WIP]
if [[ "$has_no_verify" == true && "$has_message_flag" == true ]]; then
    # Check if message already starts with [WIP]
    if [[ ! "$message" =~ ^\[WIP\] ]]; then
        message="[WIP] $message"
    fi

    # Rebuild the command with the modified message
    git "$command" "${other_args[@]}" "$message"
else
    # Pass through to the command as-is
    git "$command" "${other_args[@]}"
fi
