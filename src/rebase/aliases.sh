#!/usr/bin/env bash
alias rc='git hook run pre-commit --ignore-missing && git rebase --continue'
# rebase continue with no verification
alias rcv='git rebase --continue'
alias ri='git rebase -i'
