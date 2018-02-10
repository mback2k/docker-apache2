#!/bin/sh
set -e

echo "#!/bin/bash" > /usr/local/sbin/apache2d

if [ -f "/etc/apache2/envvars" ]; then
    echo "source /etc/apache2/envvars" >> /usr/local/sbin/apache2d
fi

echo "exec /usr/sbin/apache2 \${APACHE_ARGUMENTS}" >> /usr/local/sbin/apache2d

chown --reference=/usr/sbin/apache2 /usr/local/sbin/apache2d
chmod --reference=/usr/sbin/apache2 /usr/local/sbin/apache2d

exit 0
