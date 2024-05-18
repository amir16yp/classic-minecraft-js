# classic-minecraft-js

A project dedicated to preserving and modding the JS version of classic minecraft (classic.minecraft.net)<br/>
This project, to differentiate from other classicJS reversing projects, does not violate any copyright law, since the user must retrieve their own assets and patch their own source code using the included scripts.<br/>
Consider this as simply a copyright-issue free "build system" for classic JS. If microsoft decides to take down projects that straight up store their assets on GitHub (which they have every right to), this is your alternative.<br/>
Since there are better implementations of mod support than mine, I will porting other projects features to this. For now, it has basic custom command and block support.
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
