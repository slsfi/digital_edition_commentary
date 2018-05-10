#!/bin/bash
if [ ! -f "/opt/svn/edith/init" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  svn mkdir -m "creating dirs" file:///opt/svn/edith/documents/
  svn mkdir -m "creating dirs" file:///opt/svn/edith/documents/trunk/
  touch /opt/svn/edith/init
fi
java -jar /var/lib/jetty/start.jar -DFOREGROUND