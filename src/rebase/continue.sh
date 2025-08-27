#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

isProgress=$("${SCRIPT_DIR}/isInProgress.sh")

if [[ "isProgress" == 0 ]]; then
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
