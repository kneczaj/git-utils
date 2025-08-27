#!/usr/bin/env bash

set -e
NAME=${1}

mkdir "${NAME}"
cd "${NAME}"
git init
touch .gitignore
git add .gitignore
git commit -m 'Initial commit'
