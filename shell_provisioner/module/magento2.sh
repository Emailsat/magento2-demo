#!/bin/bash

# Magento 2

pushd /vagrant

git clone https://github.com/magento/magento2.git
cd magento2
composer.phar install

cd bin
./magento setup:install \
  --base-url=http://${APP_DOMAIN}/ \
  --db-name=${APP_DBNAME} \
  --db-user=${APP_DBUSER} \
  --db-password=${APP_DBPASSWORD} \
  --admin-firstname=John \
  --admin-lastname=Doe \
  --admin-email=john.doe@${APP_DOMAIN} \
  --admin-user=admin \
  --admin-password=p4ssw0rd \
  --language=nl_NL \
  --currency=EUR \
  --timezone=Europe/Brussels

./magento setup:static-content:deploy

cd ..

composer.phar config repositories.magento composer http://packages.magento.com
composer.phar require magento/sample-data 1.0.0-beta

cd bin
./magento setup:upgrade
./magento sampledata:install admin

popd

