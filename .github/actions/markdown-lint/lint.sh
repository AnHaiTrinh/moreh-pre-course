#!/bin/bash
set -e

EXIT_CODE=0

find . -type f -name "*.md" | while IFS= read -r file; do
    echo "--------------------------------"
    echo "Checking: $file"
    if ! proselint "$file"; then
        EXIT_CODE=1
    fi
done

exit "$EXIT_CODE"
