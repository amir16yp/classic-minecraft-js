#!/bin/bash

check_command() {
    if ! command -v "$1" &> /dev/null
    then
        echo "$1 could not be found"
        exit 1
    fi
}

check_command prettier
check_command diff

mkdir -p patch/
if [ ! -f "assets/js/app.js" ]; then
    echo "original app.js not found; downloading with curl"
    check_command curl
    mkdir -p assets/js/ # if the user didnt use download-assets.py yet they likely dont have this directory
    curl "https://classic.minecraft.net/assets/js/app.js" -o "assets/js/app.js"
fi
prettier --ignore-path /dev/null "assets/js/app.js" > "patch/original.js"
prettier --ignore-path /dev/null app.js > "patch/modified.js"

diff -u "patch/original.js" "patch/modified.js" > "patch/mod.patch"
