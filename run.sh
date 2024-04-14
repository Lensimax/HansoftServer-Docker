#!/bin/sh

CONFIGFILE=server.config

if [ -d Databases ]; then
	echo "Starting from existing server"
else
	echo "Creating config file..."

	CONFIG_CONTENT=(
		"ServerName $HANSOFT_SERVER_NAME"
		"ServerPort 50256"
		"ServiceName \"HPMServer\""
		"DatabaseName $HANSOFT_SERVER_DATABASE_NAME"
		"DatabasePassword $HANSOFT_SERVER_DATABASE_PASSWORD"
		"ServerPassword $HANSOFT_SERVER_ADMIN_PASSWORD"
	)

	echo "" > "$CONFIGFILE"
	for line in "${CONFIG_CONTENT[@]}"; do
		echo "$line" >> "$CONFIGFILE"
		echo $'\n ' >> "$CONFIGFILE"
	done

	# echo $'ServerName $HANSOFT_SERVER_NAME\n' > $CONFIGFILE
	# echo $'ServerPort 50256\n' >> $CONFIGFILE
	# echo $'ServiceName "HPMServer"\n' >> $CONFIGFILE
	# echo $'DatabaseName "My Projects"\n' >> $CONFIGFILE
	# echo $'DatabasePassword "qwerty"\n' >> $CONFIGFILE
	# echo $'ServerPassword "qwerty"\n' >> $CONFIGFILE

	cat $CONFIGFILE

	echo "Configuring server..."

	# ls
	./HPMServer -CreateConfig $CONFIGFILE
	# ./HPMServer -Install -ServerName "My Hansoft Server" -DatabaseName "My Projects" -Port 50256 -ServerAdminPassword "azerty" -DatabaseAdminPassword "azerty" -Service "HPMServer" -RunAsUser hansoft -RunAsGroup hansoft
	echo "Server configured."
fi

echo "Server started !"
./HPMServer -RunAsProgram
