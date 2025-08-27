#!/usr/bin/env bash

set -e
NAME=${1}

mkdir "${NAME}"
cd "${NAME}"
git init
touch LICENSE
git add LICENSE
git commit -m 'Initial commit'
