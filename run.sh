#!/bin/sh

CONFIGFILE=server.config

if [ -d Databases ]; then
	echo "Creating config file..."

	echo $'ServerName "Node Hansoft"\n' > $CONFIGFILE
	echo $'ServerPort 50256\n' >> $CONFIGFILE
	echo $'ServiceName "HPMServer"\n' >> $CONFIGFILE
	echo $'DatabaseName "My Projects"\n' >> $CONFIGFILE
	echo $'DatabasePassword "qwerty"\n' >> $CONFIGFILE
	echo $'ServerPassword "qwerty"\n' >> $CONFIGFILE

	cat $CONFIGFILE

	echo "Configuring server..."

	# ls
	./HPMServer -CreateConfig $CONFIGFILE
	# ./HPMServer -Install -ServerName "My Hansoft Server" -DatabaseName "My Projects" -Port 50256 -ServerAdminPassword "azerty" -DatabaseAdminPassword "azerty" -Service "HPMServer" -RunAsUser hansoft -RunAsGroup hansoft
	echo "Server configured."
fi

echo "Server started !"
./HPMServer -RunAsProgram
