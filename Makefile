.PHONY: info php ruby node latex rust

UID := $(shell id -u)
GID := $(shell id -g)

# PHP container info
PHP_NAME = php-dev-container
PHP_VERSION = 1.0
PHP_PORT = 8000

# Ruby container info
RUBY_NAME = ruby-dev-container
RUBY_VERSION = 1.0
RUBY_PORT = 4000

# Node container info
NODE_NAME = node-dev-container
NODE_VERSION = 1.0
NODE_PORT = 3000

# LaTeX container info
LATEX_NAME = latex-dev-container
LATEX_VERSION = 1.0

# Rust container info
RUST_NAME = rust-dev-container
RUST_VERSION = 1.0
RUST_PORT = 8000

info: # Show available images
	@echo "Available dev containers:"
	@echo "- php: PHP 8.2, Laravel 12, Composer"
	@echo "- ruby: Ruby 3.2, Jekyll"
	@echo "- node: Node.js 22, npm"
	@echo "- latex: texlive-latex-extra"
	@echo "- rust: Rust 1.78, cargo"
	@echo ""
	@echo "To run a container:"
	@echo "docker run -it -p <PORT>:<PORT> -v <MOUNT_DIR>:/workspace <IMAGE>"

php: # Build PHP dev container
	docker build --build-arg USER_UID=$(UID) --build-arg USER_GID=$(GID) -t $(PHP_NAME):$(PHP_VERSION) -f ./php/Dockerfile ./php/

ruby: # Build Ruby dev container
	docker build --build-arg USER_UID=$(UID) --build-arg USER_GID=$(GID) -t $(RUBY_NAME):$(RUBY_VERSION) -f ./ruby/Dockerfile ./ruby/

node: # Build Node.js dev container
	docker build --build-arg USER_UID=$(UID) --build-arg USER_GID=$(GID) -t $(NODE_NAME):$(NODE_VERSION) -f ./node/Dockerfile ./node/

latex: # Build LaTeX dev container
	docker build --build-arg USER_UID=$(UID) --build-arg USER_GID=$(GID) -t $(LATEX_NAME):$(LATEX_VERSION) -f ./latex/Dockerfile ./latex/

rust: # Build Rust dev container
	docker build --build-arg USER_UID=$(UID) --build-arg USER_GID=$(GID) -t $(RUST_NAME):$(RUST_VERSION) -f ./rust/Dockerfile ./rust/
