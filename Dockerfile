FROM mback2k/ubuntu:xenial

MAINTAINER Marc Hoersken "info@marc-hoersken.de"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        apache2 \
        supervisor && \
    apt-get clean

EXPOSE 80 443

ENV APACHE_ARGUMENTS -DFOREGROUND

ENV DOCKER_WEBSITES_DIR /run/docker-websites.d

ADD docker-entrypoint.d/ /run/docker-entrypoint.d/

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
