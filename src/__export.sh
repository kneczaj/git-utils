#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

source ${SCRIPT_DIR}/aliases/__export.sh

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
alias fgql="${SCRIPT_DIR}/fixGql.sh"
alias rr="${SCRIPT_DIR}/restoreChanges.sh"
alias create="${SCRIPT_DIR}/create/create.sh"
