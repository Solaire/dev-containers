# 🐋 Dev Containers - Docker containers for every occasion

`dev-containers` offers a collection Dockerfiles for various language-specific development environments. The goal is to offer **reproducible, disposable containers** that eliminate the need to install a billion toolchains and dependencies directly on your system. Especially useful for temporary or isolated projects like [Advent of Code](https://adventofcode.com/).

## Containers

All containers are Linux-based. Each container installs the following packages:
- `git`
- `bash`
- `vim`
- `sudo`
- `make`
- `curl`
- `unzip`
- `zip`

The required packages are defined in the `scripts/install_tools.sh` script.

### PHP (Laravel)
A container for developing PHP applications using the Laravel framework.

**Includes:**
- PHP 8.2
- Laravel 12
- Composer

### Ruby
Suited for building: webapps using "Rails", static sites with "Jekyll", or general Ruby programming.

**Includes:**
- Ruby 3.2
- Jekyll
- Rails

### Node.js
General-purpose environment for JavaScript and web applications.

**Includes:**
- Node.js v22
- npm

### rust
Ideal for systems programming, CLI tools, and web backends.

**Includes:**
- rust
- cargo

### LaTeX
Provides most required tools and packages for compiling LaTeX documents.

**Includes:**
- `texlive-latex-extra`
- `texlive-latex-recommended`
- `texlive-science`
- `latexmk`
- `xetex`
- `luatex`
- `texlive-fonts`

## Building & Running

Use the included `Makefile` to build container images easily:
```sh
make php # or ruby, node, etc.
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

## Future
- **PHP Container**:
  - Add `node` and `npm` to support JS tooling (e.g. Laravel Mix, Vite).
- **New Containers**:
  - `go`
  - `C & C++`
- **Remote debugging support**
- **VSCode integration**:
  - `.devcontainer` configuration.
  - Recommended extensions.
  - Volume mounts for workspaces.

  