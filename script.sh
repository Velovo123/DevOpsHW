#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

passwd_file="/etc/passwd"

all_users=$(awk -F: '{print $1}' "$passwd_file")

if [ -z "$all_users" ]; then
    echo "No users found in /etc/passwd."
else
    echo "All users in /etc/passwd:"
    echo "$all_users"
fi

exit 0
