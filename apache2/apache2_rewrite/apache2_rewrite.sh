#!/bin/bash

apt -y install apache2

# disable the default apache site - this is done simply for testing
a2dissite 000-default.conf

cat > /etc/apache2/sites-available/rewrite_remove_directory.conf <<EOF
<VirtualHost *:80>

    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html

    # turn rewrites on!
    RewriteEngine on
    RewriteRule ^/blog /index.html

    # https://httpd.apache.org/docs/2.4/mod/core.html#loglevel
    # to understand the stanza below:
    # the LogLevel for modules where this vhost has served a request is "warn"
    # the LogLevel for the rewrite module is "trace6"
    LogLevel warn rewrite:trace6
    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
EOF
a2enmod rewrite
a2ensite rewrite_remove_directory.conf

service apache2 restart

cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html>
<body>
<p>Simple HTML Document.</p>
</body>
</html>
EOF
