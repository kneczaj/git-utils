#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

set -e
NAME=${1}

mkdir "${NAME}"
cd "${NAME}"
git init
touch LICENSE
git add LICENSE
git commit -m 'Initial commit'
cp -f ${SCRIPT_DIR}/.gitignore.node ./.gitignore
git commit --all -m 'Gitignore content'
