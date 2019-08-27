[sika.io](https://sika.io) | <ondrej@sika.io> | [go to course ->](#course) | [install docker ->](#install-docker)

![](images/docker_github.svg)

# Docker Training

    Ondrej Sika <ondrej@ondrejsika.com>
    https://github.com/ondrejsika/docker-training

My Docker course with code examples.

## About Course

### Docker training in Czech Republic

- [ondrej-sika.cz/skoleni/docker](https://ondrej-sika.cz/skoleni/docker?_s=gh-dte)
- [skoleni-docker.cz](https://skoleni-docker.cz/?_s=gh-dte)

### Docker training in Europe

- [ondrej-sika.com/training/docker](https://ondrej-sika.com/training/docker?_s=gh-dte)

### Any Questions?

Write me mail to <ondrej@ondrejsika.com>


### Related Repositories

#### Traefik

- https://github.com/ondrejsika/traefik-le
- https://github.com/ondrejsika/traefik-ssl

#### Related courses

- https://github.com/ondrejsika/kubernetes-training-examples
- https://github.com/ondrejsika/kubernetes-install-bare-metal


### Lector notes

#### Download Images before course, prevent slow connections

```
./pull-images.sh
```

If you want update list of used images in file `images.txt`, run `./save-image-list.sh` and remove locally built images.


## Course

## What is Docker?

Docker is an open-source project that automates the deployment of applications inside software containers ...

Docker containers wrap up a piece of software in a complete filesystem that contains everything it needs to run: code, runtime, system tools, system libraries – anything you can install on a server.


## Containers vs virtualization

### Virtualization

A VM is an abstraction of physical hardware. Each VM has a full server hardware stack from virtualized BIOS to virtualized network adapters, storage, and CPU.

That stack allows run any OS on your host but it takes some power.

### Containers

Containers are abstraction in linux kernel, just proces, memory, network, … namespaces.

Containers run in same kernel as host - it is not possible use different OS or kernel version, but containers are much more faster than VMs.

## Docker Advantages

- Performance
- Management
- Application (image) distribution

## Docker Disadvantages

- Security
- One kernel / "Linux only"

## Usage of Docker

- Almost everywhere
- Development, Testing, Production
- Better (easier, faster) deployment process
- Separates running applications

## Docker works with

- Kubernetes ([Kubernetes Training](https://github.com/ondrejsika/kubernetes-training))
- Swarm

## Install Docker

- Official installation - <https://docs.docker.com/engine/installation/>
- My install instructions (in Czech) - <https://ondrej-sika.cz/docker/instalace/>

## Test the installation

```
docker run hello-world
```

![](images/test-the-installation.png)


## Basic Usage

## Image and Container

An __image__ is an inert, immutable, file that's essentially a snapshot of a container. Images are created with the build command, and they'll produce a __container__ when started with run. Images are stored in a Docker registry.

## System Wide Info

- `docker info` - system vide information
- `docker system df` - docker disk usage
- `docker system prune` - cleanup unused data
- `docker version` - print version


## Docker Images

- `docker image ls` - list all images
- `docker image ls -q` - quiet output, just IDs
- `docker image rm <image>` - remove image
- `docker image history <image>` - show image history
- `docker image inspect <image>` - show image properties

## Docker Registry

Docker image name also contains location of it source. Those names can be used:

- `debian` - Official images on Docker Hub
- `ondrejsika/debian` - User (custom) images on Docker Hub
- `reg.istry.cz/debian` - Image in my own registry


## Docker Run

```
docker run <image> [<command>]
```

Examples

```
docker run hello-world
docker run debian date
docker run -ti debian
```

## Containers

- `docker ps` - list containers
- `docker start <container>`
- `docker stop <container>`
- `docker restart <container>`
- `docker logs <container>` - show STDOUT & STDERR
- `docker rm <container>` - remove container

## Common Docker Run Params

- `--name <name>`
- `--rm` - remove container after stop
- `-d` - run in detached mode
- `-ti` - map TTY a STDIN (for bash eg.)
- `-e <variable>=<value>` - set ENV variable
- `-h <hostname>` - set hostname
- `-u <user>` - run command by specific user

## List Containers

- `docker ps` - list running containers
- `docker ps -a` - list all containers
- `docker ps -a -q` - list IDs of all containers

Example of `-q`

```
docker rm -f $(docker ps -a -q)
```

## Docker Exec

```
docker exec <container> <command>
```

Arguments

- `-d` - run in detached mode
- `-e <variable>=<value>` - set ENV variable
- `-ti` - map TTY a STDIN (for bash eg.)
- `-u <user>` - run command by specific user

Example

```
docker run --name db -d postgres
docker exec -ti -u postgres db psql
```

## Docker Logs

```
docker logs [-f] <container>
```

Examples

```
docker logs my-debian
docker logs -f mydebian  # following
```

## Docker Inspect

Get lots of information about container in JSON.

```
docker inspect <container>
```

## Docker Volumes

- Volumes are persistent data storage for containers.
- Volumes can be shared between containers and data are written directly to host.

Examples

- `docker run -ti -v /data debian`
- `docker run -ti -v my-volume:/data debian`
- `docker run -ti -v $(pwd)/my-data:/data debian`

## Port Forwarding

Docker can forward specific port from container to host

```
docker run -p <host port>:<cont. port> nginx
```

Example

```
docker run -ti -p 8080:80 nginx
```

See <http://127.0.0.1:8080>

## Own Images

## Dockerfile

__Dockerfile__ is preferred way to create images.

__Dockerfile__ defines each layer of image by some command.

To make image use command `docker build`

- `FROM <image>` - define base image
- `RUN <command>` - run command and save as layer
- `COPY <local path> <image path>` - copy file or directory to image layer
- `ADD <source> <image path>` - instead of copy, archives added by add are extracted
- `ENV <variable> <value>` - set ENV variable
- `USER <user>` - switch user
- `WORKDIR <path>` - change working directory
- `VOLUME <path>` - define volume
- `ENTRYPOINT <command>` - executable
- `CMD <command>` - parameters for entrypoint

## .dockerignore

- Ignore files for docker build process.
- Similar to `.gitignore`

Example of `.dockerignore`

```.dockerignore
Dockerfile
out
node_modules
.DS_Store
```

## Build Image from Dockerfile

- `docker build <path> -t <image>` - build image
- `docker build <path> -f <dockerfile> -t <image>`
- `docker tag <source image> <target image>` - rename docker image


## Practice

## Simple Image

See [Simple Image](examples/simple-image) example

### Get Source

```
wget https://raw.githubusercontent.com/ondrejsika/docker-training/master/examples/simple-image/app.py
wget https://raw.githubusercontent.com/ondrejsika/docker-training/master/examples/simple-image/requirements.txt
```

Or download files [app.py](https://raw.githubusercontent.com/ondrejsika/docker-training/master/examples/simple-image/app.py), [requirements.txt](https://raw.githubusercontent.com/ondrejsika/docker-training/master/examples/simple-image/requirements.txt) manually.

### Create Dockerfile

Let's create Dockerfile together.

There are few steps, how to get propper Dockerfile.

```bash
cat > Dockerfile.1 <<EOF
FROM debian:10
WORKDIR /app
RUN apt update
RUN apt install -y python3 python3-pip
RUN rm -rf /var/lib/apt/lists/*
COPY . .
RUN pip3 install -r requirements.txt
CMD python3 app.py

EOF
```

Build

```
docker build -t simple-image:1 -f Dockerfile.1 .
```

Run

```
docker run --name simple-image -d -p 8000:80 simple-image:1
```

See <http://127.0.0.1:8000>

Stop & remove container

```
docker rm -f simple-image
```

Let's update the Dockerfile

```bash
cat > Dockerfile.2 <<EOF
FROM debian:10
WORKDIR /app
RUN apt update && \
    apt install -y python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*
COPY . .
RUN pip3 install -r requirements.txt
CMD python3 app.py

EOF
```

Build & Run

```
docker build -t simple-image:2 -f Dockerfile.2 .
docker run --name simple-image -d -p 8000:80 simple-image:2
```

See <http://127.0.0.1:8000>

Stop & remove container

```
docker rm -f simple-image
```

Let's update the Dockerfile again. Install only required not recommended packages.

```bash
cat > Dockerfile.3 <<EOF
FROM debian:10
WORKDIR /app
RUN echo 'APT::Install-Recommends "0";\nAPT::Install-Suggests "0";' > /etc/apt/apt.conf
RUN apt update && \
    apt install -y python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*
COPY . .
RUN pip3 install -r requirements.txt
CMD python3 app.py

EOF
```

Build & Run

```
docker build -t simple-image:3 -f Dockerfile.3 .
docker run --name simple-image -d -p 8000:80 simple-image:3
```

See <http://127.0.0.1:8000>

Stop & remove container

```
docker rm -f simple-image
```

Let's update the Dockerfile for better caching.

```bash
cat > Dockerfile.4 <<EOF
FROM debian:10
WORKDIR /app
RUN echo 'APT::Install-Recommends "0";\nAPT::Install-Suggests "0";' > /etc/apt/apt.conf
RUN apt update && \
    apt install -y python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*
COPY requirements.txt .
RUN pip3 install -r requirements.txt
COPY . .
CMD python3 app.py

EOF
```

Build & Run

```
docker build -t simple-image:4 -f Dockerfile.4 .
docker run --name simple-image -d -p 8000:80 simple-image:4
```

See <http://127.0.0.1:8000>

Stop & remove container

```
docker rm -f simple-image
```

Final touch. Source image and CMD.

```bash
cat > Dockerfile.5 <<EOF
FROM python:3.7-slim
WORKDIR /app
COPY requirements.txt .
RUN pip3 install -r requirements.txt
COPY . .
CMD ["python3", "app.py"]

EOF
```

Build & Run

```
docker build -t simple-image:5 -f Dockerfile.5 .
docker run --name simple-image -d -p 8000:80 simple-image:5
```

See <http://127.0.0.1:8000>

Stop & remove container

```
docker rm -f simple-image
```

## Image Size Differences

List images and see the difference in image sizes

```
docker image ls simple-image
```

![](images/image-sizes.png)


## Build Arguments

Example in Dockerfile

```dockerfile
ARG FROM_IMAGE=debian:9
FROM $FROM_IMAGE
```

```dockerfile
FROM debian
ARG $PYTHON_VERSION=3.7
RUN apt update && \
    apt install python==$PYTHON_VERSION
```

Build using

```
docker build \
  --build-arg FROM_IMAGE=python .
docker build .

docker build \
  --build-arg PYTHON_VERSION=3.6 .
```

See [Build Args](examples/build-args) example.

## Multi Stage Builds

### Dockerfile for multistage builds

```dockerfile
FROM java-jdk as build
RUN grade assembly

FROM java-jre
COPY --from=build /build/demo.jar .
```

### Build Multistage Images

```bash
# By default, last stage is used
docker build -t <image> <path>

# Select output stage
docker build -t <image> --target <stage> <path>
```

Examples

```
docker build -t app .
docker build -t build --target build .
```

## Practice

## Multistage Image

See [Multistage Image](examples/multistage-image) example

### Get Source

```
wget https://raw.githubusercontent.com/ondrejsika/docker-training/master/examples/multistage-image/app.go
```

Or download file [app.go](https://raw.githubusercontent.com/ondrejsika/docker-training/master/examples/multistage-image/app.go) manually.


### Standard Image

```bash
cat > Dockerfile.1 <<EOF
FROM golang
WORKDIR /app
COPY app.go .
RUN go build app.go
CMD ["./app"]

EOF

```

Build & Run

```
docker build -t multistage-image:1 -f Dockerfile.1 .
docker run --name multistage-image -d -p 8000:80 multistage-image:1
```

See <http://127.0.0.1:8000>

Stop & remove container

```
docker rm -f multistage-image
```

See the image size

```
docker image ls multistage-image
```

### Multistage Image (based on Debian)

```bash
cat > Dockerfile.2 <<EOF
FROM golang as build
WORKDIR /build
COPY app.go .
RUN go build app.go

FROM debian:10
COPY --from=build /build/app .
CMD ["/app"]

EOF

```

Build & Run

```
docker build -t multistage-image:2 -f Dockerfile.2 .
docker run --name multistage-image -d -p 8000:80 multistage-image:2
```

See <http://127.0.0.1:8000>

Stop & remove container

```
docker rm -f multistage-image
```

See the image size

```
docker image ls multistage-image
```

### Multistage Image (from Scratch)

If you build you Go app to static binary (no dynamic dependencies), you can create image from scratch - without OS.

```bash
cat > Dockerfile.3 <<EOF
FROM golang as build
WORKDIR /build
COPY app.go .
ENV CGO_ENABLED=0
RUN go build -a -ldflags \
    '-extldflags "-static"' app.go

FROM scratch
COPY --from=build /build/app .
CMD ["/app"]

EOF

```


Build & Run

```
docker build -t multistage-image:3 -f Dockerfile.3 .
docker run --name multistage-image -d -p 8000:80 multistage-image:3
```

See <http://127.0.0.1:8000>

Stop & remove container

```
docker rm -f multistage-image
```

See the image size

```
docker image ls multistage-image
```

![](images/image-size-multistage.png)


## Docker Networks

Docker support those network drivers:

- bridge (default)
- host
- none
- custom (bridge)

### Bridge (default)

```
docker run debian ip a
```

### Host

```
docker run --net host debian ip a
```

### None

```
docker run --net none debian ip a
```

### Network Commands

- `docker network ls`
- `docker network create <network>`
- `docker network rm <network>`

### Create Network

Example:

```
docker network create -d bridge my_bridge
```

Run & Add Containers:

```bash
# Run on network
docker run -d --net=my_bridge --name nginx nginx
docker run -d --net=my_bridge --name apache httpd

# Connect to network
docker run -d --name nginx2 nginx
docker network connect my_bridge nginx2
```

Test the network

```
docker run -ti --net my_bridge ondrejsika/host nginx
docker run -ti --net my_bridge ondrejsika/host apache
docker run -ti --net my_bridge ondrejsika/curl nginx
docker run -ti --net my_bridge ondrejsika/curl apache
```

