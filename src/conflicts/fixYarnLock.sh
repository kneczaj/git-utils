#!/usr/bin/env bash
set -e
YARN_LOCK=${1}
FILE="$(basename "${YARN_LOCK}")"
test "$FILE" = "yarn.lock";
DIR="$(dirname "${YARN_LOCK}")"

cd ${DIR} || exit 1
rr './yarn.lock'
yarn
