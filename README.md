# classic-minecraft-js

A project dedicated to preserving and modding the JS version of classic minecraft (classic.minecraft.net).

This project, to differentiate from other classicJS reversing projects, does not violate any copyright law, since the user must retrieve their own assets and patch their own source code using the included scripts.

Consider this as simply a copyright-issue free "build system" for classic JS. If microsoft decides to take down projects that straight up store their assets on GitHub (which they have every right to), this is your alternative.

By default this includes a port of [js0.23-improved](https://github.com/RobinBoers/js0.23-improved), as well as `experimental.patch` which is my fork of it with extra features such as programmable commands and custom blocks. Another patch that is included is `documented.patch` which contains a patch with documentation and reversing from @TheSunCat [repo](https://github.com/TheSunCat/Minecraft-Classic-Reversed), which helps a lot for understanding the code.
## Instructions

### Install dependencies

This requires a *nix system or WSL, python3, prettier (js code formatter), wget and curl.<br/>

### Setup

Clone the repo or download the zip.

```shell
git clone https://github.com/amir16yp/classic-minecraft-js.git
cd classic-minecraft-js
```

Use the python script to download all the assets

```shell
python3 download-assets.py --use-wget
```

Apply the patches  

```shell
./apply-patch.sh
```

To run the game, run

````shell
python3 -m http.server
````

and go the url that is printed.

### Modding

To update or create a patch, modify your root folder app.js to your liking, and then run `bash create-patch.sh`. I highly recommend applying `documented.patch` first however.

The next time you will run `bash apply-patch.sh` will generate your modified app.js.
