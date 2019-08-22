#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo -e "This script must be run as root. Make sure you used sudo:"
    echo -e "sudo ./update_scadabr.sh"
    exit 1
fi


mango=mango-1.12.4.zip
scadabr=ScadaBR-1.0CE.zip
CURRENT_FOLDER=`pwd`

echo -e " - Stopping Tomcat"
/opt/tomcat6/apache-tomcat-6.0.53/bin/shutdown.sh
sleep 10
echo -e " - Removing ScadaBR"
rm -R /opt/tomcat6/apache-tomcat-6.0.53/webapps/ScadaBR
echo -e " - Extracting Mango"
unzip -o $mango -d /opt/tomcat6/apache-tomcat-6.0.53/webapps/ScadaBR/
echo -e " - Extracting ScadaBR 1.0CE"
unzip -o $scadabr -d /opt/tomcat6/apache-tomcat-6.0.53/webapps/
echo -e " - Restarting Tomcat"
/opt/tomcat6/apache-tomcat-6.0.53/bin/startup.sh
