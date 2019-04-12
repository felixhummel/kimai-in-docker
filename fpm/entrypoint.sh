#!/bin/bash
set -euo pipefail

echo 'initializing' >&2
# poor man's templating for autoconf
autoconf_path=/var/www/html/includes/autoconf.php

cat <<'EOF' > $autoconf_path
<?php
$server_hostname = "MYSQL_HOSTNAME";
$server_database = "MYSQL_DATABASE";
$server_username = "MYSQL_USERNAME";
$server_password = "MYSQL_PASSWORD";
$server_prefix   = "MYSQL_PREFIX";
$language        = "KIMAI_LANGUAGE";
$password_salt   = "KIMAI_PASSWORD_SALT";
$defaultTimezone = "PHP_TIMEZONE";
$skin            = "KIMAI_SKIN";
$authenticator   = "kimai";
$billable        = array (
  0 => 0,
  1 => 50,
  2 => 100,
);
EOF

chown www-data: $autoconf_path

sed \
  --in-place \
  -e "s|MYSQL_HOSTNAME|$MYSQL_HOSTNAME|" \
  -e "s|MYSQL_DATABASE|$MYSQL_DATABASE|" \
  -e "s|MYSQL_USERNAME|$MYSQL_USERNAME|" \
  -e "s|MYSQL_PASSWORD|$MYSQL_PASSWORD|" \
  -e "s|MYSQL_PREFIX|$MYSQL_PREFIX|" \
  -e "s|KIMAI_LANGUAGE|$KIMAI_LANGUAGE|" \
  -e "s|KIMAI_PASSWORD_SALT|$KIMAI_PASSWORD_SALT|" \
  -e "s|PHP_TIMEZONE|$PHP_TIMEZONE|" \
  -e "s|KIMAI_SKIN|$KIMAI_SKIN|" \
  $autoconf_path

echo 'starting' >&2
exec php-fpm "$@"

