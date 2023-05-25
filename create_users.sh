#!/bin/bash

# Parse command-line arguments
while getopts ":u:p:" opt; do
  case $opt in
    u) username="$OPTARG";;
    p) password="$OPTARG";;
    \?) echo "Invalid option -$OPTARG" >&2;;
  esac
done

# Check if username and password are provided
if [ -z "$username" ] || [ -z "$password" ]; then
    echo "Username and password are required."
    exit 1
fi

# Create user and set home directory
sudo useradd -m -d "/nfs/shareddir/$username" -s /usr/sbin/nologin $username
echo "$username:$password" | sudo chpasswd

echo "User $username created with home directory /nfs/shareddir/$username."