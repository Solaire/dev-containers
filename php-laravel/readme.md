## PHP (Laravel) dev container

Docker dev image for building web applications with PHP + Laravel. Contains the following tools:
- PHP 8.2
- Laravel 12
- Composer

### Usage

To build the latest version of the Docker image:
`./build_image.sh`

Run container with mounted directory:
```sh
./run_container.sh <project-directory>

Example ./run_container.sh ~/git/my-php-app
```

## Future
- Change to generic PHP container
- Add `node` or `bun` to support JS frontend frameworks