#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
set -e
git config --global submodule.recurse true
"${SCRIPT_DIR}/src/conflicts/__install.sh"
npm install -g vite-node
