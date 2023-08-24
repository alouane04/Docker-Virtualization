# Welcome to Containerize: A Docker Introduction

## Introduction to Docker

### What is Docker?
- Docker revolutionizes software packaging and delivery by isolating applications into containers. Each container is a self-contained, lightweight unit with its own environment.
- These containers are highly portable and can be seamlessly moved between systems thanks to Docker's orchestration capabilities.
- Docker streamlines container creation and management.
- It's also a collaborative platform for discovering and sharing containerized applications and services.

**Note**: Docker is not virtualization; it operates with a single underlying OS, partitioned into isolated environments.

### Understanding Containers
- A container encapsulates all the components required to run an application, including the code, configurations, processes, networking, and dependencies.
- A container comprises:
    - The application code.
    - Configuration files.
    - Isolated processes.
    - Networking configurations to facilitate communication between containers.
    - Dependencies bundled within the container.
    - A minimal OS subset to support the application.

### How Docker Works
Docker replicates essential Linux server services within the Linux Kernel for each container. Each container is a self-contained environment, isolated from others. For example, one container might run a Red Hat Linux-based database, while another runs an Ubuntu Linux-based web server that communicates with the database. Docker manages these setups efficiently.

## About Docker

- Docker serves as both a client and a server program.
- It's a command-line tool (the "docker" command) for interacting with Docker.
- Docker also functions as a server program, managing running Linux systems.
- It provides the capability to build containers from code, including code dependencies.
- Docker facilitates container distribution across the internet, enabling users to discover and share containerized applications.
- Docker is also the name of the company behind these technologies.

## Docker Common Commands

Here is a selection of frequently used Docker commands:

- `docker build`: Create an image from a Dockerfile.
- `docker run`: Launch a container based on an image.
- `docker start`: Begin an existing container.
- `docker stop`: Halt a running container.
- `docker rm`: Delete a stopped container.
- `docker exec`: Execute a command within a running container.
- `docker pull`: Download an image from a registry.
- `docker push`: Upload an image to a registry.
- `docker images`: List local machine images.
- `docker ps`: Display running containers.
- `docker logs`: View container logs.

Additional Docker commands:
- `docker inspect`: Retrieve detailed information about a container or image.
- `docker login`: Log in to a registry.
- `docker logout`: Log out from a registry.
- `docker tag`: Add a tag to a local repository image.
- `docker save`: Save an image to a tar archive.
- `docker load`: Load an image from a tar archive.
- `docker system prune`: Remove unused data locally.
- `docker volume create`: Create a volume.
- `docker volume rm`: Delete one or more volumes.

Please refer to the Docker documentation or use `docker --help` for a comprehensive list of commands.
