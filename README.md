Installation
-------------------

 * [Install Docker](https://docs.docker.com/installation/) or [askubuntu](http://askubuntu.com/a/473720)
 * Pull the latest version of image.
 
```bash
docker pull romeoz/docker-memcached
```

Alternately you can build image yourself.

```bash
git clone https://github.com/romeoz/docker-memcached.git
cd docker-memcached
docker build -t="$USER/memcached" .
```

Quick Start
-------------------

Run memcached container:

```bash
docker run --name memcached -d \
  -p 11211:11211 \
  romeoz/docker-memcached
```

Command-line arguments
-------------------

You can customize the launch command of Memcached server by specifying arguments to memcached on the docker run command. For example the following command sets max memory to use for items in megabytes:

```bash
docker run --name memcached -d \
  -p 11211:11211 \
  romeoz/docker-memcached -m 64
```

Out of the box
-------------------
 * Ubuntu 16.04 LTS
 * Memcached 1.4 or 1.5

License
-------------------

Memcached docker image is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT)