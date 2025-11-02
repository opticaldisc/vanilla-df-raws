#!/bin/bash

# Destroy and recreate output directory
rm -r raw_files
mkdir -p raw_files

# Download zip file
wget -q "$1" -O temp.zip

# List all files in zip to check paths
files=$(unzip -l temp.zip | awk '{print $4}')

# Extract files based on their path
for file in $files; do
    if [[ $file == raw/objects/* || $file == data/vanilla/*/objects/* ]]; then
        unzip -j temp.zip "$file" -d raw_files/
    fi
done

# Clean up
rm temp.zip
