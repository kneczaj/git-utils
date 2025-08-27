#!/usr/bin/env bash

# Shortcut from fix-graphql
# This file fixes git conflict of graphql codegen

git restore --staged $GRAPHQL_FILES
git restore $GRAPHQL_FILES

${CODEGEN_COMMAND}

git add $GRAPHQL_FILES
