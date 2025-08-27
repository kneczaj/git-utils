#!/usr/bin/env bash
set -e
PACKAGE_LOCK=${1}
FILE="$(basename "${PACKAGE_LOCK}")"
test "$FILE" = "package-lock.json";
DIR="$(dirname "${PACKAGE_LOCK}")"

cd ${DIR} || exit 1
rr './package-lock.json'
npm install
