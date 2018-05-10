#!/bin/bash
chown -R www-data:www-data /opt/svn
if [ ! -f "/opt/svn/init.done" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  svn mkdir -m "creating dirs" file:///opt/svn/edith/documents/
  svn mkdir -m "creating dirs" file:///opt/svn/edith/documents/trunk/
  touch /opt/svn/init.done
fi
java -jar /var/lib/jetty/start.jar -DFOREGROUND