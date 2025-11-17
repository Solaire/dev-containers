# 🐋 Dev Containers - Docker containers for every occasion

`dev-containers` offers a collection Dockerfiles for various language-specific development environments. The goal is to offer **reproducible, disposable containers** that eliminate the need to install a billion toolchains and dependencies directly on your system. Especially useful for temporary or isolated projects like [Advent of Code](https://adventofcode.com/).

## Prerequisites

Install docker and docker compose. For Debian-based systems, you can use the following command:
```sh
sudo apt install docker.io docker-compose
```

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
A container for developing PHP applications using the Laravel framework. Also includes NodeJS to support inertiajs integration.

**Includes:**
- PHP 8.2
- Laravel 12
- Composer
- Node.js v22

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

### OCaml
Provides support for OCaml programming language with opam package manager

**Includes:**
- `dune`
- `utop`
- `ocaml-lsp`
- `merlin`


### Building containers

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

## Docker compose

As of tag `2.0`, this repository also provides `docker-compose` configuration files. Docker compose files are designed to be used for creating multiple related containers (e.g. database + admin panel), and might require additional environment configuration (e.g. default username + password).

As opposed to the docker containers above, compose recipes are designed to be less "general-purpose". This means that, at the moment, additional base software (like vim or git) is not added to the containers.

### Postgres
Defined in the `docker-compose-postgres.yaml`, this compose configuration will build images for 2 containers:
- **postgres:16**: Object-relational database system.
- **pgadmin:4.8**: Web-based database administration system.

The environment configuration for those containers can be found in the `.env.example` file.

### Building

First step should be to make an `.env` file from the example provided:
```sh
cp docker-compose/.env.example docker-compose/.env
```

You can build the specified container with the following command:
```sh
docker compose -f {path/to/compose.yaml} up -d
```

This will run the containers and detach them.

Alternatively use `make`:
```sh
make postgres
```

## Future
- **New Containers**:
  - `go`
  - `C & C++`
- **Remote debugging support**
- **VSCode integration**:
  - `.devcontainer` configuration.
  - Recommended extensions.
  - Volume mounts for workspaces.