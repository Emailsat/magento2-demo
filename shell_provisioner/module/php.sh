#!/bin/bash

# PHP

apt-get -y install php5-cli php5-fpm php5-dev php5-apcu php5-curl php5-intl \
    php5-mysql php5-sqlite php-pear php5-gd php5-mcrypt php5-xdebug php5-xsl

sed -i 's/;date.timezone.*/date.timezone = Europe\/Brussels/' /etc/php5/fpm/php.ini
sed -i 's/;date.timezone.*/date.timezone = Europe\/Brussels/' /etc/php5/cli/php.ini
sed -i 's/^user = www-data/user = vagrant/' /etc/php5/fpm/pool.d/www.conf
sed -i 's/^group = www-data/group = vagrant/' /etc/php5/fpm/pool.d/www.conf

# xdebug
cat << EOF >>/etc/php5/mods-available/xdebug.ini
xdebug.remote_enable=1
xdebug.remote_autostart=1
xdebug.remote_host=192.168.33.1
xdebug.max_nesting_level=250
; xdebug.profiler_enable=1
; xdebug.profiler_output_dir=/vagrant/dumps
EOF

# composer
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin
composer.phar config -g github-oauth.github.com ${GITHUB_OAUTH_TOKEN}

# phpunit
wget -P /usr/bin https://phar.phpunit.de/phpunit.phar
chmod +x /usr/bin/phpunit.phar
ln -s /usr/bin/phpunit.phar /usr/bin/phpunit

