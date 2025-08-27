#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# normally this could be an alias to GIT, but it does not work with Git bash prompt
alias prefixWipGit="${SCRIPT_DIR}/wipPrefix.sh"
