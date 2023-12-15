#!/bin/bash
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 [search directory] [file pattern]"
    exit 1
fi
SEARCH_DIR=$1
FILE_PATTERN=$2

# set the target directory, under the same directory as the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
TARGET_DIR="${SCRIPT_DIR}/files"
mkdir -p "${TARGET_DIR}"

# recursively search the directory tree for the files matching the pattern
# copies the directory structure with the matching files
rsync -avm --include='*/' --include="${FILE_PATTERN}" --exclude='*' "${SEARCH_DIR}/" "${TARGET_DIR}/"
echo "Files matching '${FILE_PATTERN}' copied from ${SEARCH_DIR} to ${TARGET_DIR}."
