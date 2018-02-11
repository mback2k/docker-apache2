#!/bin/bash
set -e

if [ -d "${DOCKER_WEBSITES_DIR}" ]; then
    pushd "${DOCKER_WEBSITES_DIR}"
    for website in *.conf; do
        ln -sf "${DOCKER_WEBSITES_DIR}/$website" "/etc/apache2/sites-available/$website"
        ln -sf "/etc/apache2/sites-available/$website" "/etc/apache2/sites-enabled/$website"
    done
    popd
fi

exit 0
