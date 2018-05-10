FROM openjdk:8

ADD ./edith /tmp

WORKDIR /var/lib/

RUN tar -xzf /tmp/jetty.tar.gz -C /var/lib/ && mv /var/lib/jetty-distribution-9.4.9.v20180320 /var/lib/jetty

WORKDIR /var/lib/jetty/

RUN  mv /tmp/edith.war /var/lib/jetty/webapps/

RUN mkdir /opt/svn/

#RUN svn checkout https://github.com/niklil/svn_test.git /opt/svn/edith/ && chmod 777 /opt/svn/edith/

WORKDIR /var/lib/jetty/

RUN cp bin/jetty.sh /etc/init.d/jetty && echo JETTY_HOME=`pwd` > /etc/default/jetty

RUN chmod 775 /tmp/entrypoint_jetty.sh

EXPOSE 80

CMD /tmp/entrypoint_jetty.sh
