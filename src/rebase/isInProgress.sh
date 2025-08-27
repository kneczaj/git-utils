#!/usr/bin/env bash
# The folder rebase-apply seems to appear with rebase,
# but a folder rebase-merge shows up only with with rebase -i.

test -d "$GIT_DIR/rebase-merge" || test -d "$GIT_DIR/rebase-apply"
