# Use an official Node.js image as the base
FROM node:22

# Set the working directory inside the container
WORKDIR /workspace

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    bash \
    vim \
    && apt-get clean

# Expose port 3000 for Astro's development server
EXPOSE 3000

# Default command to keep the container running
CMD ["bash"]

# Add a non-root user with the same UID and GID as the host user (pass via build args)
ARG USERNAME=dev
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --gid $USER_GID $USERNAME \
  && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
  && apt-get update && apt-get install -y sudo \
  && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $USERNAME
WORKDIR /workspace
