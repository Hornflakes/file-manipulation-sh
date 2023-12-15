#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 [search directory]"
    exit 1
fi

TARGET_DIR=$1

# set the target directory, under the same directory as the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
SOURCE_DIR="${SCRIPT_DIR}/files"

if [ ! -d "${SOURCE_DIR}" ] || [ ! -d "${TARGET_DIR}" ]; then
    echo "Source or target directory does not exist."
    exit 1
fi

# recursively find and replace the matching files in the target directory tree
# matches the relative path as well, to handle files with the same name, but under different directories
find "${SOURCE_DIR}" -type f | while read src_file; do
    relative_path="${src_file#${SOURCE_DIR}/}"
    target_file="${TARGET_DIR}/${relative_path}"

    if [ -f "${target_file}" ]; then
        cp "${src_file}" "${target_file}"
        echo "Replaced ${target_file}"
    else
        echo "No matching file in target directory for: ${relative_path}"
    fi
done
echo "Replacement complete."
