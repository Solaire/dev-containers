FROM debian:bullseye-slim

# Set the working directory inside the container
WORKDIR /workspace

# Install system dependencies and a useful subset of LaTeX packages
RUN apt-get update && apt-get install -y \
    git \
    bash \
    vim \
    sudo \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-latex-recommended \
    texlive-latex-base \
    latexmk \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

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

# Switch to non-root user
USER $USERNAME
WORKDIR /workspace
