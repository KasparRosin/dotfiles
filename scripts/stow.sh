#! /bin/bash

STOW_FOLDERS=(zsh git vim vimrc);

for folder in ${STOW_FOLDERS[@]}
do
    echo "Creating a symlink with $folder"
    stow -D $folder
    stow $folder
done