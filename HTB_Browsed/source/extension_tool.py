#!/usr/bin/python3.12
import json
import os
from argparse import ArgumentParser
from extension_utils import validate_manifest, clean_temp_files
import zipfile

EXTENSION_DIR = '/opt/extensiontool/extensions/'

def bump_version(data, path, level='patch'):
#...[snip]...

def package_extension(source_dir, output_file):
#...[snip]...

def main():
    parser = ArgumentParser(description="Validate, bump version, and package a browser extension.")
    parser.add_argument('--ext', type=str, default='.', help='Which extension to load')
    parser.add_argument('--bump', choices=['major', 'minor', 'patch'], help='Version bump type')
    parser.add_argument('--zip', type=str, nargs='?', const='extension.zip', help='Output zip file name')
    parser.add_argument('--clean', action='store_true', help="Clean up temporary files after packaging")

    args = parser.parse_args()

    if args.clean:
        clean_temp_files(args.clean)

    args.ext = os.path.basename(args.ext)
    if not (args.ext in os.listdir(EXTENSION_DIR)):
        print(f"[X] Use one of the following extensions : {os.listdir(EXTENSION_DIR)}")
        exit(1)

    extension_path = os.path.join(EXTENSION_DIR, args.ext)
    manifest_path = os.path.join(extension_path, 'manifest.json')

    manifest_data = validate_manifest(manifest_path)

    # Possibly bump version
    if (args.bump):
        bump_version(manifest_data, manifest_path, args.bump)
    else:
        print('[-] Skipping version bumping')

    # Package the extension
    if (args.zip):
        package_extension(extension_path, args.zip)
    else:
        print('[-] Skipping packaging')


if __name__ == '__main__':
    main()

