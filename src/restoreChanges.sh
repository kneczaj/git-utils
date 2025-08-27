#!/usr/bin/env bash

# restore changes in given files

git restore --staged "$@"
git restore "$@"
