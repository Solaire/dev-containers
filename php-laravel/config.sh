#!/bin/bash

# === This file defines the constants for the Laravel (PHP) Docker image ===

# Name of Docker image
readonly IMAGE_NAME="laravel-dev-container"

# Exposed port
readonly PORT=8000

# Constants for Docker image versioning.
readonly VERSION_MAJOR=1
readonly VERSION_MINOR=0

# Make a version tag for the Docker image.
readonly VERSION_TAG="v${VERSION_MAJOR}.${VERSION_MINOR}"

readonly FULL_IMAGE="${IMAGE_NAME}:${VERSION_TAG}"