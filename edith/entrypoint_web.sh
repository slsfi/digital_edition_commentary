#!/bin/bash
cp /tmp/dav_svn.conf /etc/apache2/mods-enabled/dav_svn.conf 
exec apache2ctl -DFOREGROUND
