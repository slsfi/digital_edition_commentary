FROM openjdk:8

ADD ./edith /tmp

WORKDIR /var/lib/

RUN export RUNLEVEL=1 && echo exit 0 > /usr/sbin/policy-rc.d && chmod +x /usr/sbin/policy-rc.d

RUN tar -xzf /tmp/jetty.tar.gz -C /var/lib/ && mv /var/lib/jetty-distribution-9.4.9.v20180320 /var/lib/jetty

WORKDIR /var/lib/jetty/

RUN  mv /tmp/edith.war /var/lib/jetty/webapps/

RUN apt-get update && apt-get -y install subversion apache2 libapache2-mod-svn && mkdir /opt/svn/

#RUN svn checkout https://github.com/niklil/svn_test.git /opt/svn/edith/ && chmod 777 /opt/svn/edith/

WORKDIR /var/lib/jetty/

RUN cp bin/jetty.sh /etc/init.d/jetty && echo JETTY_HOME=`pwd` > /etc/default/jetty && cp /tmp/edithusers /etc/apache2/edithusers && cp /tmp/edith_site.conf /etc/apache2/sites-available/ 

RUN chmod 775 /tmp/entrypoint.sh && a2enmod proxy

EXPOSE 80

ENTRYPOINT /tmp/entrypoint.sh
