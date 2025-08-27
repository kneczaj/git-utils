#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

git="${SCRIPT_DIR}/wipPrefix.sh"

alias cv='${git} commit --no-verify'
alias cav='${git} commit --all --no-verify'
alias cnv='${git} commit --amend --no-verify'
alias cnev='${git} commit --amend --no-edit --no-verify'
alias cnav='${git} commit --all --amend --no-verify'
alias cnaev='${git} commit --all --amend --no-edit --no-verify'
