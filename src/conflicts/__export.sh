#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
alias fgql="${SCRIPT_DIR}/fixGql.sh"
alias fimp="yarn vite-node ${SCRIPT_DIR}/tsImports/src/index.ts"
alias fixConflicts="${SCRIPT_DIR}/fixConflicts.sh"
alias fixYarnLock="${SCRIPT_DIR}/fixYarnLock.sh"
alias fixPackageLock="${SCRIPT_DIR}/fixPackageLock.sh"
