#!/bin/bash

argv1=$1

source ~/.config/user-dirs.dirs
customPath=$XDG_TEMPLATES_DIR

if [ -d "$customPath" ]; then
    echo -e "Custom path already exists. Merging files...\n(If you already do have a file with the same file name in that target directory, you'll be prompted to choose which one to keep)"
    mv -i $argv1/* $customPath
    rm -rf $argv1
else
    mkdir $customPath
    mv $argv1/* $customPath
    rm -rf $argv1
    echo "Created custom Templates folder and added files."
fi

echo "Menu created, restarting nautilus...\n"
nautilus -q && nautilus &
echo -e "\nInstallation completed!"