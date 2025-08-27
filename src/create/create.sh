#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

set -e
name=${1}
template=${2}

availableTemplates="base node"

if ! echo "$availableTemplates" | grep -wq "$template"; then
  echo "usage: <dir name> <template>, where template is one of: ${availableTemplates}"
  exit 1
fi

mkdir "${name}"
cd "${name}"
git init
touch LICENSE
git add LICENSE
git commit -m 'Initial commit'

git remote add template git@github.com:kneczaj/template-base-ts.git
git fetch template
git merge --squash --allow-unrelated-histories template/${template}
git commit -m "feat: use template ${template}"
