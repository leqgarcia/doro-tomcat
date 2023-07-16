#docker run -p 6080:80 -v /dev/shm:/dev/shm dorowu/ubuntu-desktop-lxde-vnc

FROM dorowu/ubuntu-desktop-lxde-vnc


RUN rm /etc/apt/sources.list.d/googl*
RUN apt -y update

RUN apt -y install tomcat9 tomcat9-user tomcat9-admin tomcat9-examples default-jre pcscd libnss-mdns fonts-dejavu-extra fonts-ipafont-gothic fonts-ipafont-mincho fonts-indic tomcat9-docs


RUN mv /usr/share/tomcat9/skel/conf /usr/share/tomcat9/

RUN mkdir /usr/share/tomcat9/logs

RUN mkdir -p /usr/share/tomcat9/webapps/InMind
RUN mkdir /usr/share/tomcat9/webapps/InMind1

RUN mv /usr/share/tomcat9-docs/docs /usr/share/tomcat9/webapps
RUN mv /usr/share/tomcat9-root/default_root /usr/share/tomcat9/webapps/ROOT

RUN systemctl enable tomcat9

USER root

RUN sed '$ i\/usr/share/tomcat9/bin/startup.sh &'  /startup.sh > /temp.sh
RUN cat /temp.sh > /startup.sh

RUN rm /temp.sh




