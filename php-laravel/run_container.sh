#!/bin/bash

# Get the directory of this script.
# We can assume that this script will ALWAYS be in the same dir as the Docekrfile,
# but the script can be called from anywhere.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Source the configuration file
source "${SCRIPT_DIR}/config.sh"

if [ $# -eq 1 ]; then
    # Check if directory exists
    readonly MOUNT_DIR=$1
    if [ ! -d "${MOUNT_DIR}" ]; then
        echo "ERROR: Directory '${MOUNT_DIR}' does not exist"
        exit 1
    fi

    # Run the container with directory mounted
    docker run -it -p "${PORT}:${PORT}" -v "${MOUNT_DIR}:/workspace" ${FULL_IMAGE} 
    echo "Container running with '${MOUNT_DIR}' mounted to '/workspace'."
else
    # Run the container without mounting anything
    docker run -it -p "${PORT}:${PORT}" ${FULL_IMAGE}
    echo "Container running without mounting any directory."
fi