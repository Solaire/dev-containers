# Docker Dev Containers

This repository provides Dockerfiles for various language-specific development environments. The goal is to offer **reproducible, disposable containers** that eliminate the need to install toolchains and dependencies directly on your system -- especially useful for temporary or isolated projects.

## Containers

Each container is Linux-based and includes the following common tools:
- `bash`
- `git`
- `vim`

### PHP (Laravel)
A container designed for developing PHP applications using the Laravel framework.

**Included:**
- PHP 8.2
- Laravel 12
- Composer

### Ruby (Jekyll)
Suited for static site development with the Jekyll SSG.

**Included:**
- Ruby 3.2
- Jekyll

### Node.js
General-purpose JavaScript development and web applications.

**Included:**
- Node.js v22
- npm

### rust
Ideal for systems programming, CLI tools, and web backends.

**Included:**
- rust
- cargo

### LaTeX
A lightweight container for compiling LaTeX documents.

**Included:**
- `texlive-latex-extra`
- `latexmk`

#### Usage inside the container
```sh
latexmk -pdf main.tex
```

## Building & Running

Use the included `Makefile` to build container images easily
```sh
make php # or ruby, node
```

If no make target is provided, it will show a list of available containers.

### Running containers

You can run your container with the following command:
```sh
docker run -it -p <port>:<port> -v <host-dir>:/workspace <image>
```

Example:
```sh
docker run -it -p 4000:4000 -v ~/projects/my-app:/workspace php-dev-container:1.0
```

### Notes
- Containers must be run in interactive mode (-it). Without it, they will exit immediately since no long-running process is started by default.
- Mounting a volume is optional, but necessary if you want your code and edits to persist.
- Images built with `Makefile` will dynamically create a user that matches your host UID and GID. This is the recommended approach. 
  - When building without specifying the UID and GID, the files created inside the container will be owned by root -- this will likely cause permission issues on the host (e.g. in VSCode or Git).
  - You can manually fix the permission issues by running `chown $USER [file]`.

## Troubleshooting & Dev Tips

> Coming soon: Examples like resetting file permissions, entering a stopped container, running without port mapping, and more.

## Future
- **PHP Container**:
  - Add `node` and `npm` to support JS tooling (e.g. Laravel Mix, Vite).
- **Ruby Container**:
  - Add support for the `Rails` framework.
- **New Containers**:
  - `go`
  - `C & C++`
- **Remote debugging support**
- **VSCode integration**:
  - `.devcontainer` configuration.
  - Recommended extensions.
  - Volume mounts for workspaces.

  