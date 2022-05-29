#!/bin/bash

RESOLV_FILE="/etc/resolv.conf"
DNS_LOCAL_STRING="nameserver 127.0.0.1"
FILE_START_COMMENT="# Generated by NetworkManager"

# Checking for permissions
# https://stackoverflow.com/a/18216122
if [ "$EUID" -ne 0 ]
  then echo "Root privileges required, exiting..."
  exit 1
fi

if test -e $RESOLV_FILE
  then
    RESOLV_FILE_NEW="$RESOLV_FILE.`date +%Y%m%d.%H%M%S`.back"
    echo "Found $RESOLV_FILE, backing up to: $RESOLV_FILE_NEW"
    cp -a $RESOLV_FILE $RESOLV_FILE_NEW
  else
    echo "File $RESOLV_FILE does not exist"
    exit 2
fi

if grep -Fxq "$DNS_LOCAL_STRING" $RESOLV_FILE
  then
    echo "Disabling local DNS..."
    sed -i "/$DNS_LOCAL_STRING/d" $RESOLV_FILE
  else
    echo "Enabling local DNS..."
    sed -i "/$FILE_START_COMMENT/a $DNS_LOCAL_STRING" $RESOLV_FILE
fi

echo "----\$ cat $RESOLV_FILE----"
cat $RESOLV_FILE

exit $?
