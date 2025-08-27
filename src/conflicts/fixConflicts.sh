#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

git ls-files --unmerged | cut -f2 | sort -u | while read file; do
    yarn vite-node "${SCRIPT_DIR}/tsImports/src/index.ts" "$file" && npm run fix "$file" && git add "$file"
done
