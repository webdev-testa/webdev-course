#!/bin/bash

SOURCE="3. Intermediate HTML"
DEST="."

# Move all files and folders from SOURCE to DEST
shopt -s dotglob # includes hidden files (if any)
mv "$SOURCE"/* "$DEST"/

# Remove the now-empty SOURCE folder
rmdir "$SOURCE"