#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

env "$(cat "${SCRIPT_DIR}/.env" | sed -e '/#/d' | xargs)"

source "${SCRIPT_DIR}/sourced/gitAliases.sh"

# git aliases overwrites SCRIPT_DIR
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
source "${SCRIPT_DIR}/sourced/path.sh"
