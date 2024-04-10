#!/bin/sh

echo "Configuring server..."
./HPMServer -CreateConfig server.config
echo "Server configured."

echo "Server started !"
./HPMServer -RunAsProgram
