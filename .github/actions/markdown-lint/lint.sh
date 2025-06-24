#!/bin/bash

find . -type f -name "*.md" | while IFS= read -r file; do
    echo "--------------------------------"
    echo "Checking: $file"
    if ! proselint "$file"; then
        exit 1
    fi
done
