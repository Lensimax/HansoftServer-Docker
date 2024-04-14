
# Hansoft Server Docker

[![Docker Stars](https://img.shields.io/docker/stars/lensimax/hansoftserver.svg)](https://hub.docker.com/r/lensimax/hansoftserver)
[![Docker Pulls](https://img.shields.io/docker/pulls/lensimax/hansoftserver
)](https://hub.docker.com/r/lensimax/hansoftserver)

This repository provides a streamlined approach to setting up and running a Hansoft Server using Docker. Docker is a prevalent containerization platform that enables you to execute applications within isolated sandbox environments, promoting portability and reproducibility.

## Create your own Hansoft server

* Install `docker` and `docker-compose`
* Create your `docker-compose.yml` you have an exemple here [docker-compose.yml](docker-compose.yml)
* Run your server with `docker-compose up` or `docker-compose up -d` to run as a deamon

## Restore from an Hansoft Backup

* Backup the old server with `Full backup including history and documents`
* Run the server on the same major version
* Copy the backup folder `<datetime>.VersionControl` with `docker cp <backupFolder> hansoft-server:/opt/HansoftServer/Databases/<DatabaseName>/Backup/`
* Connect to the server administration with `Hansoft Server Administrator`
* Restore from the backup `.VersionControl`
* Change licence

## Building Hansoft Image with a custom version

```bash
docker build . -t <image tag> --build-arg="HANSOFT_VERSION=<hansoft-version>" --no-cache
```

The available versions from official Hansoft web site are :
- 9.2104
- 9.1105
- 10.0064
- 10.1041
- 10.2073
- 11.1006
- 11.0053
- 11.1056

### Build example

```bash
docker build . -t lensimax/hansoftserver:11.1006 --build-arg="HANSOFT_VERSION=11.1006" --no-cache
```
