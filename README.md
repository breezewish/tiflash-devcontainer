# tiflash-devcontainer

This repository is the source of the Docker image [breezewish/tiflash-dev](https://hub.docker.com/repository/docker/breezewish/tiflash-dev), which is used as TiFlash's DevContainer.

## Image Content

- Base image: CentOS 7
- ccache 4.6.3
- clang 15.0.7
- git 2.38.0
- zsh 5.8.1
- oh-my-zsh
- Python 3.10.7
- cmake 3.22.6
- Ninja-build 1.11.1
- GitHub CLI 2.17.0
- Rustup (latest)

## Roadmap

- [x] x86_64
- [ ] ARM64
- [ ] GitHub Action to build and release image
