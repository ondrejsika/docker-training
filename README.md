[Ondrej Sika (sika.io)](https://sika.io) | <ondrej@sika.io> | [go to course ->](#course) | [install docker ->](#install-docker)

![](images/docker_github.svg)

# Docker Training

## About Course

- [Docker Training in Czech Republic & Slovakia](https://ondrej-sika.cz/skoleni/docker?x_source=github-ondrejsika-docker-training&_s=gh-dte)
- [Docker Training in Europe](https://ondrej-sika.com/training/docker?x_source=github-ondrejsika-docker-training&_s=gh-dte)

#### Related Courses

- [Kubernetes Training in Czech Republic & Slovakia](https://ondrej-sika.cz/skoleni/kubernetes?x_source=github-ondrejsika-docker-training&_s=gh-dte)
- [Kubernetes Training in Europe](https://ondrej-sika.com/training/kubernetes?x_source=github-ondrejsika-docker-training&_s=gh-dte)

### Any Questions?

Write me mail to <ondrej@sika.io>

## Course

## About Me - Ondrej Sika

**Freelance DevOps Engineer, Consultant & Lecturer**

- Complete DevOps Pipeline
- Open Source / Linux Stack
- Cloud & On-Premise
- Technologies: Git, Gitlab, Gitlab CI, Docker, Kubernetes, Terraform, Prometheus, ELK / EFK, Rancher, Proxmox

## Star, Create Issues, Fork, and Contribute

Feel free to star this repository or fork it.

If you found bug, create issue or pull request.

Also feel free to propose improvements by creating issues.

### Chat

For sharing links & "secrets".

- Slack - https://sikapublic.slack.com/
- Microsoft Teams
- https://sika.link/chat (tlk.io)

## DevOps Kniha (Czech only)

[![](./images/devops_kniha.jpg)](https://kniha.sika.io)

<https://kniha.sika.io>

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

## Usage of Docker

- Almost everywhere
- Development, Testing, Production
- Better (easier, faster) deployment process
- Separates running applications

## Docker containers in cluster

- Kubernetes
- ~~Docker Swarm~~

## Docker Editions (CE / EE)

### Docker Engine Community

Docker CE is ideal for individual developers and small teams looking to get started with Docker and experimenting with container-based apps.

### Docker Engine Enterprise

Docker Engine - Enterprise is designed for enterprise development of a container runtime with security and an enterprise grade SLA in mind.

### Docker Enterprise

Docker Enterprise is designed for enterprise development and IT teams who build, ship, and run business critical applications in production at scale.

Source: https://docs.docker.com/install/overview/

## 12 Factor Apps

[12factor.net](https://12factor.net)

Set of 12 rules how to write modern applications.

## Install Docker

- Official installation - <https://docs.docker.com/engine/installation/>
- My install instructions (in Czech) - <https://ondrej-sika.cz/docker/instalace/>
- Bash Completion on Mac - <https://blog.alexellis.io/docker-mac-bash-completion/>

## Test the installation

```
docker run hello-world
```

![](images/test-the-installation.png)

### Remote Docker (over SSH)

You can use remote Docker using SSH. Just export varibale `DOCKER_HOST` with `ssh://root@docker.sikademo.com` and your local Docker clint will be executed on docker.sikademo.com server.

```
export DOCKER_HOST=ssh://root@docker.sikademo.com
docker version
docker info
```

## Docker plugin for VS Code

<https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker>

## Basic Usage

## Image and Container

An **image** is an inert, immutable, file that's essentially a snapshot of a container. Images are created with the build command, and they'll produce a **container** when started with run. Images are stored in a Docker registry.

## System Wide Info

- `docker version` - print version
- `docker info` - system wide information
- `docker system df` - docker disk usage
- `docker system prune` - cleanup unused data
- `docker volume prune --all` - cleanup unused volumes (including named volumes)

## Docker Images

- `docker pull <image>` - download an image
- `docker image ls` - list all images
- `docker image ls -q` - quiet output, just IDs
- `docker image ls <image>` - list image versions
- `docker image rm <image>` - remove image
- `docker image inspect <image>` - show image properties

Update all local images

```
docker image ls --format="{{.Repository}}:{{.Tag}}" | xargs -I {} docker pull {}
```

## Docker Registry

Docker image name also contains location of it source. Those names can be used:

- `debian` - Official images on Docker Hub
- `ondrejsika/debian` - User (custom) images on Docker Hub
- `ghcr.io/ondrejsika/debian` - Github Container Registry
- `ttl.sh/debian` - Image in my own registry

### Own Docker Registry

**Docker Registry** is build in **Gitlab** and **Github** for no additional cost. You can find it in packages section.

You can run registry manually using this command:

```
docker run -d -p 5000:5000 --restart=always --name registry registry:2
```

See full deployment configuration here: <https://docs.docker.com/registry/deploying/>

### Docker Registry in Self-Hosted Gitlab

You have to add `registry_external_url` to Your Gitlab config and reconfigure.

```
echo "registry_external_url 'registry.example.com'" >> /etc/gitlab/gitlab.rb
gitlab-ctl reconfigure
```

### My Example Registry: simple-registry.sikademo.com

See: <https://simple-registry.sikademo.com/v2/_catalog>

Deployed into Kubernetes by [sikalabs/simple-registry](https://github.com/sikalabs/charts/tree/master/charts/simple-registry) chart

### sikalabs/simple-registry chart

Setup SikaLabs Charts

```
helm repo add sikalabs https://helm.sikalabs.io
helm repo update
```

Install **sikalabs/simple-registry** chart

```
helm install registry sikalabs/simple-registry --set host simple-registry.sikademo.com
```

### ttl.sh - Anonymous & ephemeral Docker image registry

- https://ttl.sh/
- https://github.com/replicatedhq/ttl.sh

## Crane

- <https://github.com/google/go-containerregistry/tree/main/cmd/crane>
- <https://github.com/google/go-containerregistry/blob/main/cmd/crane/doc/crane.md>

### Install Crane

Mac

```
brew install crane
```

Linux (using [slu](https://github.com/sikalabs/slu))

```
slu install-bin crane
```

### Copy Image

Copy image from one registry to another without pulling it to local machine.

```
crane copy <source> <destination>
```

example

```
crane copy sikalabs/dev ttl.sh/dev
```

### List Image Tags (versions)

```
crane ls ghcr.io/sikalabs/slu
```

## Docker Run

```
docker run [ARGS] <image> [<command>]
```

### Examples

Basic Docker Run

```
docker run hello-world
```

With custom command

```
docker run debian cat /etc/os-release
```

```
docker run ubuntu cat /etc/os-release
```

With TTY & Standart Input

```
docker run -ti debian
```

## Containers

- `docker container ls` - list containers
- `docker ps` - list containers
- `docker start <container>`
- `docker stop <container>`
- `docker restart <container>`
- `docker rm <container>` - remove container

## Common Docker Run Params

- `--name <name>` - set container name ([Wozniak easter egg](https://github.com/moby/moby/blob/master/pkg/namesgenerator/names-generator.go#L852))
- `-d` - run in detached mode
- `-ti` - map TTY a STDIN (for bash eg.)
- `-e <variable>=<value>` - set ENV variable
- `--env-file=<env_file>` - load all variables defined in ENV file

## Restart Policy

By default, if container process stop (or fail), container will be stopped.

You can choose another behavion using argument `--restart <restart policy>`.

- `--restart on-failure` - restart only when container return non zero return code
- `--restart always` - always, even on Docker daemon restart (server restart also)
- `--restart unless-stopped` - similar to always, but keep stopped container stopped on Docker daemon restart (server restart also)

If you want to set maximum restart count for `on-failure` restart policy, you can use: `--restart on-failure:<count>`

## List Containers

- `docker container ls` - list running containers
- `docker container ls -a` - list all containers
- `docker container ls -a -q` - list IDs of all containers

or

- `docker ps` - list running containers
- `docker ps -a` - list all containers
- `docker ps -a -q` - list IDs of all containers

Example of `-q`

```
docker rm -f $(docker ps -a -q)
```

or my `dra` (docker remove all) alias

```
alias dra='docker ps -a -q | xargs -r docker rm -f'
```

```
dra
```

Or using `slu`:

```
slu s dra
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

Postgres 15 example

```
docker run --name pg15 -e POSTGRES_PASSWORD=pg -d postgres:15
```

```
docker exec -ti pg15 bash
```

```
docker exec -ti -u postgres pg15 psql
```

Postgres 16 example

```
docker run --name pg16 -e POSTGRES_PASSWORD=pg -d postgres:16
```

```
docker exec -ti pg16 bash
```

```
docker exec -ti -u postgres pg16 psql
```

## Docker Logs

All containers have to log into STDOUT or STDERR.

Example of logging to STDOUT from legacy application - [examples/log_to_file](./examples/log_to_file)

```
docker logs [-f] [-t] <container>
```

Args

- `-f` - following output (similar to `tail -f ...`)
- `-t` - show time prefix

Examples

```
docker run --name loggen -d sikalabs/slu:v0.60.0 slu loggen --json
```

```
docker logs loggen
```

```
docker logs -f loggen
```

```
docker logs -f loggen | jq .i
```

```
docker logs -t loggen
```

```
docker logs -ft loggen
```

### Log Drivers

You can use native Docker logging or some log drivers.

For example, if you want to log into syslog, you can use `--log-driver syslog`.

You can send logs directly to **ELK** (EFK) or Graylog using **gelf**. For elk logging you have to use `--log-driver gelf –-log-opt gelf-address=udp://1.2.3.4:12201`.

See the logging docs: <https://docs.docker.com/config/containers/logging/configure/>

### Json File (Default Log Driver)

Log Driver options:

- `max-size` - Max size of log file (default `-1` - unlimited), use for example `100k` for kB, `10m` for MB or `1g` for GB.
- `max-file` - Nuber of log rotated files (default `1`)
- `compress` - Compression for rotated logs (default `disabled`)

Examle:

```
docker run --name log-rotation -d --log-opt max-size=1k --log-opt max-file=5 ondrejsika/log-rotation
```

## Docker Inspect

Get lots of information about container in JSON.

```
docker inspect <container>
```

### Inspect Format

Using Go Template Language.

Examples:

```
docker inspect loggen --format "{{.NetworkSettings.IPAddress}}"
```

```
docker inspect loggen --format "{{.LogPath}}"
```

## Docker Volumes

[Docs](https://docs.docker.com/storage/volumes/)

- Volumes are persistent data storage for containers.
- Volumes can be shared between containers and data are written directly to host.

CLI

- `docker volume` - all volume management commands
- `docker volume ls` - list all volumes
- `docker volume rm <volume>` - remove volume
- `docker volume prune` - remove all not used (not bount to container) volumes

Examples

- `docker run -ti -v /data debian`
- `docker run -ti -v my-volume:/data debian`
- `docker run -ti -v $(pwd)/my-data:/data debian`

### Get Volume Paths from Image

```
docker image inspect redis --format "{{.Config.Volumes|json}}"
```

```
docker image inspect postgres:11 --format "{{.Config.Volumes|json}}"
```

### Read only volumes

If you want to mount your volumes **read only**, you have to add `:ro` to volume argument.

Examples

- `docker run -ti -v my-volume:/data:ro debian`
- `docker run -ti -v $(pwd)/my-data:/data:ro debian`

First example does't make sense read only.

### Show All Volumes & Mounts for All Containers

```
docker ps -a --format '{{ .ID }}' | xargs -I {} docker inspect -f '{{ .Name }} ({{ .ID }}){{ printf "\n" }}{{ range .Mounts }}{{ printf "\n\t" }}{{ .Type }} {{ if eq .Type "bind" }}{{ .Source }}{{ end }}{{ .Name }} => {{ .Destination }}{{ end }}{{ printf "\n" }}' {}
```

### Find Containers Which Use Specific Volume

```
docker ps -a --filter volume=<volume>
```

Example

```
docker ps -a --filter volume=my-volume
```

### Socket forwading

If you want to forward socket into container, you can also use volume. If you work with sockets, read only parameter doesn't work.

```
docker run -v /var/run/docker.sock:/var/run/docker.sock docker docker ps
```

or

```
docker run -v /var/run/docker.sock:/var/run/docker.sock -ti docker
```

### !! Possible Security Risk !!

**You can mount your's host rootfs to container with root privileges. Everybody ho has access to docker or docker socket has root privileges on your host.**

**userns-remap can fix that**

`docker run -v /:/rootfs -ti debian`

## userns-remap

Docker can remap root user from container to hight-number user on host.

More: <https://docs.docker.com/engine/security/userns-remap/>

### Enabble userns-remap

dockerd argument

```
dockerd --userns-remap="default"
```

Config `/etc/docker/daemon.json`

```json
{
  "userns-remap": "default"
}
```

### Examples

```
docker run -v /:/rootfs -ti debian cat /rootfs/etc/shadow
```

```
docker run -v /:/rootfs -ti --userns=host debian cat /rootfs/etc/shadow
```

![docker-userns-remap-example](images/docker-userns-remap-example.png)

## Docker In Docker

Run Docker in Docker

```
docker run --name docker -d --privileged docker:dind
```

Try run any Docker command in this container:

```
docker exec docker docker info
docker exec docker docker image ls
docker exec docker docker run hello-world
docker exec -ti docker sh
```

## Port Forwarding

Docker can forward specific port from container to host

```
docker run -p <host port>:<cont. port> <image>
```

You can specify an address on the host as well

```
docker run -p <host address>:<host port>:<cont. port> <image>
```

Examples

```
docker run -ti -p 8080:80 nginx
docker run -ti -p 127.0.0.1:8080:80 nginx
```

The latter will make connection possible only from localhost.

See <http://127.0.0.1:8080>

## Own Images

## Dockerfile

**Dockerfile** is preferred way to create images.

**Dockerfile** defines each layer of image by some command.

To make image use command `docker build`

## Dockerfile Commands

- `FROM <image>` - define base image
- `RUN <command>` - run command and save as layer
- `COPY <local path> <image path>` - copy file or directory to image layer
- `ADD <source> <image path>` - instead of copy, archives added by add are extracted
- `ENV <variable> <value>` - set ENV variable
- `USER <user>` - switch user
- `WORKDIR <path>` - change working directory
- `VOLUME <path>` - define volume
- `CMD <command>` - command we want to run on container start up. Difference between `CMD` and `ENTRYPOINT` will be exaplain [later](#entrypoint-vs-command)
- `EXPOSE <port>` - Define on which port the conteiner will be listening

## .dockerignore

- Ignore files for docker build process.
- Similar to `.gitignore`

Example of `.dockerignore` for Next.js (Node) project

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

## Cross Platform Build

Use `--platform` for cross platform builds

Build AMD64

```
docker build --platform linux/amd64 .
```

Build ARM64 (for Apple Silicon)

```
docker build --platform linux/arm64 .
```

## Practice

## Simple Image

See [Simple Image](examples/simple-image) example

### Get Source

```
git clone https://github.com/ondrejsika/docker-training
cd docker-training/examples/simple-image
rm Dockerfile Dockerfile.debian
```

## Image Size Differences

List images and see the difference in image sizes

```
docker image ls simple-image
```

![](images/image-sizes.png)

## Hadolint

Hadolint is Dockerfile linter.

Github: <https://github.com/hadolint/hadolint>

### Install & Use Hadolint

Install on Mac

```
brew install hadolint
```

Use hadolint

```bash
hadolint <dockerfile>
```

You can ignore checks & specify trusted registries

```bash
hadolint --ignore DL3003 --ignore DL3006 <dockerfile> # exclude specific rules
hadolint --trusted-registry registry.sikademo.com <dockerfile>
```

### Use from Docker

You can also use Hadolint from Docker

```
docker run --rm -i hadolint/hadolint < Dockerfile
docker run --rm -i hadolint/hadolint hadolint --ignore DL3006 - < Dockerfile
```

or (for PowerShell)

```
cat Dockerfile | docker run --rm -i hadolint/hadolint
cat Dockerfile | docker run --rm -i hadolint/hadolint hadolint --ignore DL3006 -
```

## Build Arguments

Example in Dockerfile

```dockerfile
ARG FROM_IMAGE=debian:9
FROM $FROM_IMAGE
```

```dockerfile
FROM debian
ARG PYTHON_VERSION=3.7
RUN apt-get update && \
    apt-get install python==$PYTHON_VERSION
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
RUN gradle assembly

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
cd ../multistage-image
rm Dockerfile
```

## Multistage image size differences

```
docker image ls multistage-image
```

![](images/image-size-multistage.png)

## ASP.NET Core Example

Source: https://github.com/dotnet/dotnet-docker/tree/master/samples/aspnetapp

```
git clone https://github.com/dotnet/dotnet-docker.git
cd samples/aspnetapp
docker build -t dotnet-example .
docker run -ti -p 8000:80 dotnet-example
```

See: http://127.0.0.1:8000

## Kaniko

- Build Docker images in Conteiner / Kubernetes without Docker daemon
- <https://github.com/GoogleContainerTools/kaniko>

See [examples/kaniko](./examples/kaniko)

```
cd example/kaniko
make build
make run
```

## `RUN --mount=type=cache`

[examples/build_mount_cache](./examples/build_mount_cache)

## Entrypoint vs Command

### Entrypoint Examples

- [Postgress with Default Data](examples/postgres-default-data)
- [Wait for It](examples/wait-for-it)

## Docker Networks

Docker support those network drivers:

- bridge (default)
- host
- none
- custom (bridge)

### Bridge (default)

```
docker run debian:10 ip a
```

### Host

```
docker run --net host debian:10 ip a
```

### None

```
docker run --net none debian:10 ip a
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

### Macvlan Network

If you need assign IP addresses from your local network directly to containers, you have to use Macvlan.

<https://docs.docker.com/network/macvlan/>

```
docker network create -d macvlan \
  --subnet=192.168.101.0/24 \
  --ip-range=192.168.101.128/25 \
  --gateway=192.168.101.1\
  -o parent=eth0 macvlan
```

## ctop

ctop is a top-like interface for container metrics.

- [ctop.sh](https://ctop.sh/)
- [github.com/bcicen/ctop](https://github.com/bcicen/ctop)

### Install

Mac

```
brew install ctop
```

Using [slu](https://github.com/sikalabs/slu)

```
slu install-bin ctop
```

Official installation instructions: <https://github.com/bcicen/ctop#install>

### Run

```
ctop
```

or with Docker

```
docker run --rm -ti \
  --name=ctop \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  quay.io/vektorlab/ctop:latest
```

## Portainer

Portainer is a web UI for Docker.

Homepage: [portainer.io](https://www.portainer.io/)

### Run Portainer

```
docker run -d --name portainer -p 8000:8000 -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
```

See: <http://127.0.0.1:9000>

### Run Portainer behind Traefik v1

```
docker run \
  -d \
  --name portainer \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  --label=traefik.enable=true \
  --label=traefik.frontend.rule=Host:portainer.lab0.sikademo.com \
  --label=traefik.port=9000 \
  --net traefik \
  portainer/portainer
```

See: <https://portainer.lab0.sikademo.com>

### Run Portainer behind Traefik v2

https://github.com/ondrejsika/docker-compose-examples/tree/master/portainer

## Nixery.dev

Nixery.dev provides ad-hoc container images that contain packages from the Nix package manager. Images with arbitrary packages can be requested via the image name.

More at <https://nixery.dev/>

### Examples

```
docker run nixery.dev/hello hello

docker run -ti nixery.dev/htop htop

docker run -ti nixery.dev/shell/git/curl/mc bash
```

### cAdvisor (Container Advisor)

[google/cadvisor](https://github.com/google/cadvisor) (homepage)

cAdvisor (Container Advisor) provides container users an understanding of the resource usage and performance characteristics of their running containers. It is a running daemon that collects, aggregates, processes, and exports information about running containers. Specifically, for each container it keeps resource isolation parameters, historical resource usage, histograms of complete historical resource usage and network statistics. This data is exported by container and machine-wide.

Install:

```
# use the latest release version from https://github.com/google/cadvisor/releases
VERSION=v0.49.1
docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:ro \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --volume=/dev/disk/:/dev/disk:ro \
  --publish=8080:8080 \
  --detach=true \
  --name=cadvisor \
  --privileged \
  --device=/dev/kmsg \
  gcr.io/cadvisor/cadvisor:$VERSION
```

Check out:

- Web UI - <http://127.0.0.1:8080/>
- /metrics (prometheus) - <http://127.0.0.1:8080/metrics>

Run behind Traefik v1

```
VERSION=v0.46.0
docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:ro \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --volume=/dev/disk/:/dev/disk:ro \
  --detach=true \
  --name=cadvisor \
  --privileged \
  --device=/dev/kmsg \
  --label=traefik.enable=true \
  --label=traefik.frontend.rule=Host:cadvisor.lab0.sikademo.com \
  --label=traefik.port=8080 \
  --net=traefik \
  gcr.io/cadvisor/cadvisor:$VERSION
```

See: <https://cadvisor.lab0.sikademo.com>

### Run cAdvisor behind Traefik v2

https://github.com/ondrejsika/docker-compose-examples/tree/master/cadvisor

## Distroless Images

- https://github.com/GoogleContainerTools/distroless
- [examples/distroless_python](./examples/distroless_python)
- [examples/distroless_flask](./examples/distroless_flask) (multistage)
- [distroless/examples/python3](https://github.com/GoogleContainerTools/distroless/tree/main/examples/python3)
- [distroless/examples/python3-requirements](https://github.com/GoogleContainerTools/distroless/tree/main/examples/python3-requirements)

## Thank you! & Questions?

That's it. Do you have any questions? **Let's go for a beer!**

## Docker Compose

### What is Docker Compose?

**Docker Compose** is a tool for defining and running multi-container Docker applications.

With **Docker Compose**, you use a **Compose file** to configure your application's services.

### `docker-compose` vs `docker compose`

`docker-compose` is the old command. `docker compose` is the new command. Both commands are the same.

### Install Docker Compose

Docker Compose is part of Docker Desktop (Mac, Windows). Only on Linux, you have to install it:

- <https://docs.docker.com/compose/install/>
- <https://docs.docker.com/compose/completion/>

Install `docker compose` CLI plugin on Linux

```
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.7.0/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
```

on Mac (Apple Silicon)

```
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.29.7/docker-compose-darwin-aarch64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
```

Or

```
slu install-bin docker-compose
mkdir -p ~/.docker/cli-plugins/
ln -s /usr/local/bin/docker-compose ~/.docker/cli-plugins/docker-compose
```

Validate

```
docker compose version
```

### Example Compose File

```yaml
version: "3.8"
services:
  app:
    build: .
    ports:
      - 8000:80
  redis:
    image: redis
```

Here is a compose file reference: <https://docs.docker.com/compose/compose-file/compose-file-v3/>

Here is a nice tutorial for YAML: <https://learnxinyminutes.com/docs/yaml/>

### Service

Service is a container running and managed by Docker Compose.

## Run Docker Compose

```
docker compose up [ARGS] [<service>, ...]
```

Example

```
docker compose up
```

## Build Compose

Just build, don't run

```
docker compose build
```

Build without cache

```
docker compose build --no-cache
```

Build with args

```
docker compose build --build-arg BUILD_NO=53
```

## Common Compose File Attributes

### Image

Just pull & run image

```yaml
services:
  app:
    image: redis
```

### Build

Simple, just build path

```yaml
services:
  app:
    build: .
```

Extended form with every build configuration

```yaml
services:
  app:
    build:
      context: ./app
      dockerfile: ./app/docker/Dockerfile
      args:
        BUILD_NO: 1
    image: ttl.sh/app
```

### Port Forwarding

```yaml
services:
  app:
    ports:
      - 8000:80
      - 127.0.0.1:80:80
```

### Volume

Volumes are very similar but there is a little difference

```yaml
services:
  app:
    volumes:
      - /data1
      - data:/data2
      - ./data:/data3

volumes:
  data:
```

### Command

```yaml
services:
  app:
    command: ["python", "app.py"]
```

### Environment Variables

```yaml
services:
  app:
    environment:
      RACK_ENV: development
      SHOW: "true"
      SESSION_SECRET:
```

ENV Files

```yaml
services:
  app:
    env_file:
      - default.env
      - prod.env
```

### Variable Substitution

Docker Compose uses standart bash variable substitution

#### Variable with Default Value

```
services:
  app:
    image: ${IMAGE:-ondrejsika/go-hello-world:3}
```

#### Mandatory Variable

```
services:
  app:
    image: ${IMAGE?Environment variable IMAGE is required}
```

### YAML Anchors

```yaml
x-base: &base
  image: debian
  command: ["env"]

services:
  en:
    <<: *base
    environment:
      HELLO: Hello
  cs:
    <<: *base
    environment:
      HELLO: Ahoj
```

### Deploy

```yaml
services:
  app:
    deploy:
      replicas: 4
```

### Compose Project Name

```yaml
version: "3.8"
name: "compose-name-example"
```

## Create a Composite

See [simple compose example](examples/simple-compose)

```bash
git clone https://github.com/ondrejsika/docker-training.git example--simple-compose
cd example--simple-compose/examples/simple-compose
rm Dockerfile docker-compose.yml
```

Try it wihout Docker Compose. Run the example:

```
docker build -t counter .
docker network create counter
docker run --name redis -d --net counter -v redis-data:/data redis
docker run --name counter -d --net counter -p 80:80 counter
```

Stop & Remove

```
docker stop counter redis
docker rm counter redis
docker network rm counter
```

Now, we can create Docker compose and Compose File manually.

Create `Dockerfile`:

```Dockerfile
FROM python:3.7-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
CMD ["python", "app.py"]
EXPOSE 80
```

Try without Docker Compose

```
docker build -t counter .
docker network create counter
docker run --name redis -d --net counter redis
docker run --name counter -d --net counter -p 8000:80 counter
docker stop counter redis
docker rm counter redis
docker network rm counter
```

Create `docker-compose.yml`:

```
version: "3.8"
services:
    counter:
        build: .
        image: ttl.sh/examples/simple-compose/counter
        ports:
            - ${PORT:-80}:80
        depends_on:
            - redis
    redis:
        image: redis
```

## Compose Commands

- `docker compose config` - validate & see final docker compose yaml
- `docker compose ps` - see all composite's containers
- `docker compose exec <service> <command>` - run something in container
- `docker compose version` - see version of `docker-compose` binary
- `docker compose logs [-f] [<service>]` - see logs

### Compose Up Arguments

- `-d` - run in detached mode
- `--force-recreate` - always create new cont.
- `--build` - build on every run
- `--no-build` - don't build, even images not exist
- `--remove-orphans`

### Manage Compose

- `docker compose start [<service>]`
- `docker compose stop [<service>]`
- `docker compose restart [<service>]`
- `docker compose kill [<service>]`

### `docker compose up` vs `docker compose run`

`docker compose up`

- run all services (or multiple selected services)
- you can't specify command, volums, environment from cli arguments

`docker compose run`

- run only one service
- run dependencies on background
- you can specify command, volums, environment from cli arguments

### Stop and Remove Compose

```
docker compose down
```

### Scaling Compose

```
docker compose up --scale <service>=<n>
```

## Traefik

- https://traefik.io/traefik/
- https://github.com/traefik/traefik
- https://github.com/ondrejsika/ondrejsika-docker-traefik
- https://doc.traefik.io/traefik/reference/dynamic-configuration/docker/

### Docker Compose Override

If you want override your `docker-compose.yml`, you can use `-f` param for multiple compose files. You can also create `docker-compose.override.yml` which will be used automatically.

See [compose-override](examples/compose-override) example.

## Podman

## Podman shortnames.conf

Shortnames project is collecting registry alias names for shortnames to fully specified container image names.

https://github.com/containers/shortnames/blob/main/shortnames.conf

See your shortnames

```
cat /etc/containers/registries.conf.d/shortnames.conf
```

## Thank you! & Questions?

That's it. Do you have any questions? **Let's go for a beer!**

### Ondrej Sika

- email: <ondrej@sika.io>
- web: <https://sika.io>
- twitter: [@ondrejsika](https://twitter.com/ondrejsika)
- linkedin: [/in/ondrejsika/](https://linkedin.com/in/ondrejsika/)
- Newsletter, Slack, Facebook & Linkedin Groups: <https://join.sika.io>

_Do you like the course? Write me recommendation on Twitter (with handle `@ondrejsika`) and LinkedIn (add me [/in/ondrejsika](https://www.linkedin.com/in/ondrejsika/) and I'll send you request for recommendation). **Thanks**._

Wanna to go for a beer or do some work together? Just [book me](https://book-me.sika.io) :)

## Training Sessions

#### 2022-09-22 TTC

- https://github.com/sika-training-examples/2022-09-22--ttc--docker-compose

## Docker FAQ

### DNS Troubles in Docker Build

If you see something like that, it may be caused by DNS server trouble.

![FAQ DNS Trouble](images/faq-dns-trouble.png)

You can check see your DNS server using:

```
docker run debian cat /etc/resolv.conf
```

Or check if it works:

```
docker run ondrejsika/host google.com
```

![FAQ DNS Trouble 2](images/faq-dns-trouble-2.png)

You can fix it by setting Google or Cloudflare DNS to `/etc/docker/daemon.json`:

```json
{ "dns": ["1.1.1.", "8.8.8.8"] }
```

## Lecturer Notes

### Download Images before course, prevent slow connections

```
./pull-images.sh
```

If you want update list of used images in file `images.txt`, run `./save-image-list.sh` and remove locally built images.
