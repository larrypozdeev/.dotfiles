#!/bin/bash

# Save the current IFS and set a new one for newline separation
oldifs=$IFS
IFS=$'\n'

# Check if the correct number of arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 sourceDirectory destinationDirectory"
    exit 1
fi

# Validate source directory
if [ ! -d "$1" ]; then
    echo "$1 is not a valid directory"
    exit 1
fi

# Ensure destination directory exists
if [ ! -d "$2" ]; then
    mkdir -p "$2"
fi

# Get absolute paths of source and destination directories
src=$(cd "$1" && pwd)
dst=$(cd "$2" && pwd)

# Create directory structure in destination
find "$src" -type d | while read -r dir; do
    mkdir -p "$dst${dir#$src}"
done

# Hard link files in destination, preserving symbolic links
find "$src" -type f -o -type l | while read -r src_f; do
    dst_f="$dst${src_f#$src}"
    ln "$src_f" "$dst_f"
done

# Restore the original IFS
IFS=$oldifs

