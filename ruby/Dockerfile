# Use an official Ruby image as the base
FROM ruby:3.2

# Set the working directory inside the container
WORKDIR /workspace

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    bash \
    vim \
    && apt-get clean

# Install Jekyll and Bundler
RUN gem install jekyll bundler

# Expose port 4000 for Jekyll's development server
EXPOSE 4000

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
