#!/bin/sh
set -e

echo "#!/bin/bash" > /usr/local/sbin/apache2

if [ -f "/etc/apache2/envvars" ]; then
    echo "source /etc/apache2/envvars" >> /usr/local/sbin/apache2
fi

echo "exec /usr/sbin/apache2 \${APACHE_ARGUMENTS}" >> /usr/local/sbin/apache2

chown --reference=/usr/sbin/apache2 /usr/local/sbin/apache2
chmod --reference=/usr/sbin/apache2 /usr/local/sbin/apache2

exit 0
