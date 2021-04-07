FROM debian:8

#Update repos and install packages
RUN apt-get update
RUN apt-get install -y wget git sudo time

#Build the app
COPY . /tmp/ScadaBR_Installer
WORKDIR /tmp/ScadaBR_Installer
RUN ./install_scadabr.sh
WORKDIR /
RUN rm -r /tmp/ScadaBR_Installer

#Start the server
CMD sudo /opt/tomcat6/apache-tomcat-6.0.53/bin/startup.sh && sleep infinity
