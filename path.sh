#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# adds all the tools to path
PATH=${SCRIPT_DIR}/tools/:$PATH
