#!/bin/bash

# Ensure script runs as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script using sudo."
    exit 1
fi

ENTRY="127.0.0.1 postgres redis outline storage keycloak"

if ! grep -qF "$ENTRY" /etc/hosts; then
    echo "$ENTRY" >> /etc/hosts
    echo "Entry added."
else
    echo "Entry already exists."
fi