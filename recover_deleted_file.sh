#!/bin/bash

# Prompt the user for the file path
echo "Enter the path of the file you want to recover (e.g., path/to/your/file.txt):"
read FILE_PATH

# Check if the file exists in the repository
if git ls-files --error-unmatch "$FILE_PATH" > /dev/null 2>&1; then
    echo "The file is already tracked in the repository."
else
    echo "File not found. Recovering deleted file..."

    # Get the last commit where the file existed
    COMMIT_HASH=$(git log --all -- "$FILE_PATH" | grep "^commit" | head -n 1 | cut -d ' ' -f 2)

    if [ -z "$COMMIT_HASH" ]; then
        echo "File not found in any commit history."
        exit 1
    fi

    echo "Recovering file from commit: $COMMIT_HASH"

    # Checkout the file from the commit where it last existed
    git checkout "$COMMIT_HASH" -- "$FILE_PATH"

    echo "File has been recovered successfully!"
fi

