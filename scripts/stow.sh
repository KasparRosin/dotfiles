#!/bin/sh
echo 'Creating symlinks'

STOW_FOLDERS=("zsh" "git" "vim" "vimrc");

for folder in ${STOW_FOLDERS[@]}
do
    echo "Creating a symlink with $folder"
    stow -R $folder
done