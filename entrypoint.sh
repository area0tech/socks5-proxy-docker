#!/bin/bash

# Check if the USERNAME and PASSWORD environment variables are set
if [ -z "$USERNAME" ] || [ -z "$PASSWORD" ]; then
  echo "Error: USERNAME or PASSWORD environment variables are not set."
  exit 1
fi

# Create a user with the provided username and password
adduser -D "$USERNAME"
echo "$USERNAME:$PASSWORD" | chpasswd

EXIP=$(ip route get 1.2.3.4 | awk '{ print $NF }')
sed -i "s/^external: .*$/external: ${EXIP}/g" /etc/sockd.conf

# Run the command specified in the Dockerfile CMD or override it with the provided command
exec "$@"
