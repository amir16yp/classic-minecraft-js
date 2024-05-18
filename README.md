# classic-minecraft-js

A project dedicated to preserving and modding the JS version of classic minecraft (classic.minecraft.net)

## Instructions

### Install dependencies
This requires a *nix system or WSL, python3, prettier (js code formatter), wget and curl.<br/>

### Setup

clone the repo or download the zip.<br/>
`git clone https://github.com/amir16yp/classic-minecraft-js.git && cd classic-minecraft-js`<br/>
Use the python script to download all the assets<br/>
`python3 download-assets.py --use-wget`<br/>
Apply the patches<br/>
`bash apply-patch.js`<br/>
To run the game, run<br/>
`python3 -m http.server`<br/>
and go the url that is printed.<br/>

### Modding

To update the patch, modify your root folder app.js to your liking, and then run `bash create-patch.sh`.
<br/>
The next time you will run `bash apply-patch.sh` will generate your modified app.js.<br/>
Included too is a `mod.js`, which has exposes additional functionality like custom commands and registering custom blocks, without modifying app.js directly.

## Video
[![Video](https://img.youtube.com/vi/6MNwFbKnpXg/0.jpg)](https://www.youtube.com/watch?v=6MNwFbKnpXg)
