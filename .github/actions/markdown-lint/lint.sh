#!/bin/bash
set -e

EXIT_CODE=0

for file in $(find . -type f -name "*.md"); do
    echo "--------------------------------"
    echo "Checking: $file"
    proselint "$file" || EXIT_CODE=1
done

exit $EXIT_CODE