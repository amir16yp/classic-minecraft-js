import argparse
import subprocess
from requests import get
from json import loads
import os


os.makedirs('assets/textures/previews', exist_ok=True)
os.makedirs('assets/fonts', exist_ok=True)
os.makedirs('assets/js', exist_ok=True)
os.makedirs('assets/css', exist_ok=True)
os.makedirs('assets/sounds', exist_ok=True)


mc_classic_url = "https://classic.minecraft.net"


def download_with_requests(asset):
    with open(asset[1:], 'wb') as asset_file:
        asset_file.write(get(mc_classic_url + asset).content)

def download_with_wget(asset):
    subprocess.run(["wget", "-O", asset[1:], mc_classic_url + asset])

def main(use_wget):
    with open('assets.json', 'r') as f:
        assets = loads(f.read())
        for asset in assets:
            print(f"downloading {asset}")
            if use_wget:
                download_with_wget(asset)
            else:
                download_with_requests(asset)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Download assets using requests or wget.")
    parser.add_argument('--use-wget', action='store_true', help="Use wget to download assets.")
    args = parser.parse_args()

    main(args.use_wget)
