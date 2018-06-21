FROM mback2k/ubuntu:xenial

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        apache2 curl && \
    apt-get clean

EXPOSE 80 443

RUN a2dissite 000-default.conf

ENV APACHE_ARGUMENTS -DFOREGROUND

ENV DOCKER_WEBSITES_DIR /run/docker-websites.d

ADD docker-entrypoint.d/ /run/docker-entrypoint.d/

CMD ["/usr/local/sbin/apache2"]

HEALTHCHECK CMD curl -f http://localhost/ || exit 1
