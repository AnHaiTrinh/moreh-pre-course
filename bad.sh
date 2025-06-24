#!/bin/bash

for file in $(ls *.txt); do
    echo "Processing $file"
    cat $file
done

if [ $USER == "root" ]; then
    echo "Running as root"
fi

rm -rf /tmp/test/*

