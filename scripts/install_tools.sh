#!/bin/bash
set -e

# Add common tools used by all containers
apt-get update && apt-get install -y \
    git \
    bash \
    vim \
    sudo \
    make \
    curl \
    unzip \
    zip \
