# Setting up

Clone this repo. Add your github token in ```shell_provisioning/run.sh``` or the installation will fail.

Run ```vagrant up``` (only tested with Vagrant 1.6.5 and VirtualBox 4.3.26).

Add the content of ```shell_provisioner/config/hosts.txt``` in your local host file.

The setup will be for Belgium timezone, Dutch language and in Euro and will contain sample data.

The admin is available at [http://magento2.dev.ctors.net](http://magento2.dev.ctors.net) with login admin and password ```p4ssw0rd```.

PhpMyAdmin is available at [http://phpmyadmin.magento2.dev.ctors.net](http://phpmyadmin.magento2.dev.ctors.net).

All mail that is sent by the system will be captured and can be read from Roundcube.

Roundcube is available at [http://roundcube.magento2.dev.ctors.net](http://roundcube.magento2.dev.ctors.net).

