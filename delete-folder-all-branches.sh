#!/bin/bash

# Name of the folder to delete (change this if needed)
TARGET_FOLDER="2. Intro HTML"

# Fetch all branches from remote
git fetch --all

# Get list of all remote branches except HEAD and main/master
branches=$(git branch -r | grep -v '\->' | sed 's/origin\///' | grep -v '^main$' | grep -v '^master$')

# Add main and/or master explicitly if you want them processed as well
branches="main $branches"

for branch in $branches; do
    echo "Processing branch: $branch"
    git checkout $branch
    git pull origin $branch

    if [ -d "$TARGET_FOLDER" ]; then
        rm -rf "$TARGET_FOLDER"
        git add .
        git commit -m "Delete '$TARGET_FOLDER' folder from branch $branch"
        git push origin $branch
        echo "Deleted and pushed on $branch"
    else
        echo "Folder '$TARGET_FOLDER' not found in branch $branch"
    fi
done

echo "Done!"