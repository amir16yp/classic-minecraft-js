#!/bin/bash

check_command() {
    if ! command -v "$1" &> /dev/null
    then
        echo "$1 could not be found"
        exit 1
    fi
}

check_command js-beautify
check_command diff

mkdir -p patch/
if [ ! -f "assets/js/app.js" ]; then
    echo "original app.js not found; downloading with curl"
    check_command curl
    curl "https://classic.minecraft.net/assets/js/app.js" -o "assets/js/app.js"
fi

js-beautify "assets/js/app.js" > "patch/original.js"
js-beautify app.js > "patch/modified.js"

diff -u "patch/original.js" "patch/modified.js" > "patch/mod.patch"
