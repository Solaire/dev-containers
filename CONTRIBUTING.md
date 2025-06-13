# Contributing to `dev-containers`

Contributions to `dev-containers` are much appreciated. Best way to start is to look at outstanding [issues](https://github.com/Solaire/dev-containers/issues) and go from there. If you'd like to add a new container, raise an issue first.

## Pull Request Guidelines

To help keep the project maintainable and consistent, please follow these guidelines when submitting code:

- Every **pull request must be tied to an open issue**.
- **One issue per pull request**. If you're addressing multiple issues, please submit separate PRs.

## Development Guidelines

### Adding or Modifying

- Containers are isolated, so there's no harm in creating more of them as long as they serve a distinct purpose.
- Follow the naming convention `Dockerfile.<name>` and place new Dockerfiles in the `dockerfiles/` directory.
- Use the existing Makefile structure for defining build targets for new containers.

### Shared Scripts

The `scripts/` directory contains shared setup scripts used across multiple containers.

- **Before modifying `install_tools.sh`** (or other shared scripts), consider:
  - Will this change benefit **all** containers?
  - If it's specific to one language or toolchain, it may be better to handle it directly inside that container's Dockerfile.