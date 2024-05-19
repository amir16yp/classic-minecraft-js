#!/bin/bash

check_command() {
    if ! command -v "$1" &> /dev/null
    then
        echo "$1 could not be found"
        exit 1
    fi
}

check_command prettier
check_command patch

if [ ! -f "assets/js/app.js" ]; then
    echo "original app.js not found; downloading with curl"
    check_command curl
    mkdir -p assets/js/ # if the user didnt use download-assets.py yet they likely dont have this directory    
    curl "https://classic.minecraft.net/assets/js/app.js" -o assets/js/app.js
fi

# Run prettier on the target file
prettier --ignore-path /dev/null assets/js/app.js > app.js

# List all .patch files in the patch directory
patch_files=(patch/*.patch)

# Check if there are any .patch files
if [ ${#patch_files[@]} -eq 0 ]; then
    echo "No patch files found in the patch/ directory"
    exit 1
fi

# Prompt the user to select a patch file
echo "Please select a patch file to apply:"
select patch_file in "${patch_files[@]}"; do
    if [ -n "$patch_file" ]; then
        echo "Applying patch file: $patch_file"
        patch "app.js" < "$patch_file"
        break
    else
        echo "Invalid selection. Please try again."
    fi
done
