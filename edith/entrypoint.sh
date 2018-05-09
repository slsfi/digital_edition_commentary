#!/bin/bash
set -e
cp /tmp/dav_svn.conf /etc/apache2/mods-enabled/dav_svn.conf && chown -R www-data:www-data /opt/svn
apache2ctl start && java -jar start.jar