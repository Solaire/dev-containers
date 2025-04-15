#!/bin/bash

# Get the directory of this script.
# We can assume that this script will ALWAYS be in the same dir as the Docekrfile,
# but the script can be called from anywhere.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Source the configuration file
source "${SCRIPT_DIR}/config.sh"

# Build the Docker image using the version tag and the script's directory.
docker build -t ${FULL_IMAGE} "${SCRIPT_DIR}"

# Print build status (success or fail)
if [ $? -eq 0 ]; then
    echo "Docker image '${FULL_IMAGE}' built successfully!"
else
    echo "Docker build failed. Check output for errors."
fi
