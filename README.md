# file-manipulation-sh

This repo contains shell scripts for file manipulation. One use case is sending specific files to ChatGPT for it to edit them and give back to you.

## copy_files_pattern.sh

Copies files that match a naming pattern, with their directory tree, from a search directory to the `files` directory.

Run like: `./copy_files_pattern.sh /path/to/search/directory '*.pattern'`

## replace_files.sh

Replaces files in a target directory with files from the `files` directory that have the same name and the same relative path to the `files` directory as the searched files have to the target directory.

The relative path matching handles the case where multiple files have the same name, but are in different directories.

Run like: `./replace_files.sh /path/to/target/directory`
