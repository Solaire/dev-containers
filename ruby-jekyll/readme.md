## Ruby (Jekyll) dev container

Docker dev image for static website development using Ruby with Jekyll framework.

Current version: v1.0

### Usage

To build the latest version of the Docker image:
`./build_image.sh`

Run container with mounted directory:
```sh
./run_container.sh <project-directory>

Example ./run_container.sh ~/git/my-blog
```


## Future
- Change to a generic Ruby container, including popular frameworks such as Rails