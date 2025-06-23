#!/bin/bash

if [[ $# -ne 2 ]]; then
    echo "Usage: capture_error [STDOUT_FILENAME] [STDERR_FILENAME]"
    exit 1
fi

STDOUT_FILENAME=$1
STDERR_FILENAME=$2
count=0
while true; do
    ./error.sh >> $STDOUT_FILENAME 2>> $STDERR_FILENAME
    if [[ $? -ne 0 ]]; then
        echo "Command failed after $count run(s)."
        break
    fi
    ((count++))
done

echo "Standard output written to $STDOUT_FILENAME"
echo "Standard error written to $STDERR_FILENAME"