# docker-postgres
=================

Base Dockerfile for PostgreSQL database. Built upon official PostgreSQL image.
Recommended for initial setup of databases for development environment.

Getting started
---------------

I recommend that you setup your current user to manipulate docker without sudo.
Check [this](http://askubuntu.com/questions/477551/how-can-i-use-docker-without-sudo) out to learn how.

1. Build the new image (from the same directory of this Dockerfile):
```
$ docker build -t djlebersilvestre/postgres:9.4.1 .
$ docker images
REPOSITORY                  TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
djlebersilvestre/postgres   9.4.1               1d7c4f8541ec        17 seconds ago      213.9 MB

```
Or you can build directly from git:
```
$ docker build -t djlebersilvestre/postgres:9.4.1 https://github.com/djlebersilvestre/docker-postgres.git
```

2. Start the database server:
```
$ docker run --name postgres -e POSTGRES_PASSWORD=testing -d -p 127.0.0.1:5432:5432 djlebersilvestre/postgres:9.4.1
```

3. Access the database server with the psql client already installed in the image:
```
$ docker run -it --link postgres:postgres --rm djlebersilvestre/postgres:9.4.1 sh -c 'exec psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -U postgres'
```
Or you can setup your application / client to `host=127.0.0.1`,  `port=5432`, `username=postgres` and `password=testing`.

### To run the image and poke around its file system
```
$ docker run -t -i djlebersilvestre/postgres:9.4.1 /bin/bash
```

### To build a new Dockerfile upon this image (use the public image \o/)
```
FROM djlebersilvestre/postgres:9.4.1
# customize your image
```
