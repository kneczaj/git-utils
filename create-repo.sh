#!/usr/bin/env bash

set -e
NAME=${1}

mkdir "${NAME}"
cd "${NAME}"
git init
touch .gitingnore
git add .gitingnore
git commit -m 'Initial commit'
