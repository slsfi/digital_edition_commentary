#!/bin/bash
cp /tmp/dav_svn.conf /etc/apache2/mods-enabled/dav_svn.conf 
if [ ! -f "/opt/svn/edith/init" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  svn mkdir -m "creating dirs" file:///opt/svn/edith/documents/
  svn mkdir -m "creating dirs" file:///opt/svn/edith/documents/trunk/
  touch /opt/svn/edith/init
fi
chown -R www-data:www-data /opt/svn
exec java -jar /var/lib/jetty/start.jar -DFOREGROUND
exec apache2ctl -DFOREGROUND