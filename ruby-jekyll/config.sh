#!/bin/bash

# === This file defines the constants for the Ruby (Jekyll) Docker image ===

# Name of Docker image
readonly IMAGE_NAME="jekyll-dev-container"

# Exposed port
readonly PORT=4000

# Constants for Docker image versioning.
readonly VERSION_MAJOR=1
readonly VERSION_MINOR=0

# Make a version tag for the Docker image.
readonly VERSION_TAG="v${VERSION_MAJOR}.${VERSION_MINOR}"

readonly FULL_IMAGE="${IMAGE_NAME}:${VERSION_TAG}"