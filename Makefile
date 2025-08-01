.PHONY: info

UID := $(shell id -u)
GID := $(shell id -g)

# Image definitions
IMAGES := php ruby node latex rust
COMPOSE := postgres
VERSION = 2.0

info: # Show available images
	@echo "Available dev containers:"
	@echo "- php: PHP 8.2, Laravel 12, Composer"
	@echo "- ruby: Ruby 3.2, Rails, Jekyll"
	@echo "- node: Node.js 22, npm"
	@echo "- latex: texlive-latex-extra"
	@echo "- rust: Rust 1.78, cargo"
	@echo ""
	@echo "Available docker compose recipes:"
	@echo "- postgres: postgres:16, pgadmin:4.8"
	@echo ""
	@echo "To run a container:"
	@echo "docker run -it -p <PORT>:<PORT> -v <MOUNT_DIR>:/workspace <IMAGE>"

# Generic build rule for each image
$(IMAGES):
	docker build \
		--build-arg USER_UID=$(UID) \
		--build-arg USER_GID=$(GID) \
		-t $@-dev-container:$(VERSION) \
		-f dockerfiles/Dockerfile.$@ .

# Rules for docker-compose
$(COMPOSE):
	docker compose \
		-f docker-compose/docker-compose-$@.yaml \
		up -d