#!/bin/sh
set -e

if [ -d "${DOCKER_WEBSITES_DIR}" ]; then
    /usr/bin/find "${DOCKER_WEBSITES_DIR}" -name '*.conf' -execdir /bin/ln -s "${DOCKER_WEBSITES_DIR}/{}" "/etc/apache2/sites-enabled/{}" \;
fi

exit 0
