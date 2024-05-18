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
if [ ! -f "/assets/js/app.js" ]; then
    echo "original app.js not found; downloading with curl"
    check_command curl
    curl "https://classic.minecraft.net/assets/js/app.js" -o "assets/js/app.js"
fi
# Run prettier on the target file
prettier "assets/js/app.js" > "app.js"

# Apply the patch
patch "app.js" < "patch/mod.patch"
