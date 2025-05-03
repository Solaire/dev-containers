## JS (Node) dev container

Docker dev image for building web applications with Node.js v22. Contains the following tools:
- Node 22
- npm

### Usage

To build the latest version of the Docker image:
`./build_image.sh`

Run container with mounted directory:
```sh
./run_container.sh <project-directory>

Example ./run_container.sh ~/git/my-php-app
```

### Helpful commands

When building AstroJS websites, you will need to change the host and port to be available outside of the container. Example:
`astro dev --host 0.0.0.0 --port 3000`

## Future
- Add `bun` (and maybe replace Node)?