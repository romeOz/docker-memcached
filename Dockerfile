FROM ubuntu:trusty
MAINTAINER romeOz <serggalka@gmail.com>

COPY entrypoint.sh /sbin/entrypoint.sh

RUN apt-get update \
 && apt-get install -y memcached \
 && sed 's/^-d/# -d/' -i /etc/memcached.conf \
 && rm -rf /var/lib/apt/lists/* \
 && chmod 755 /sbin/entrypoint.sh

EXPOSE 11211
ENTRYPOINT ["/sbin/entrypoint.sh"]
CMD ["/usr/bin/memcached"]