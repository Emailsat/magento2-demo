#!/bin/bash

# Shell provisioner

# You need to set this or composer install will fail
GITHUB_OAUTH_TOKEN=""

MODULE_PATH='/vagrant/shell_provisioner/module'
CONFIG_PATH='/vagrant/shell_provisioner/config'

# IP for the vagrant VM
GUEST_IP='192.168.33.10'

# Set the variables below for your project

# 1) Set to your app's local domainname
APP_DOMAIN='magento2.dev.ctors.net'

# 2) Modify config/apache/app.vhost.conf and config/apache/hosts.txt to use the
#    values for APP_DOMAIN and GUEST_IP set above

# 3) App DB name and credentials
APP_DBNAME='magento2'
APP_DBUSER='magento2'
APP_DBPASSWORD='magento2'

# Hostname used by postfix
POSTFIX_HOSTNAME='vagrantbox.dev.ctors.net'

# Adding an entry here executes the corresponding .sh file in MODULE_PATH
DEPENDENCIES=(
    debian
    tools
    vim
    php
    mysql
    magento2
    apache
    phpmyadmin
    roundcube
)

for MODULE in ${DEPENDENCIES[@]}; do
    source ${MODULE_PATH}/${MODULE}.sh
done
