#!/bin/bash

. /app/date.sh --source-only

echo "$(adddate) INFO: Download and extract ovpn files"

echo "$(adddate) INFO: Create directory if no volume is done"
#Create directory if no volume is done
mkdir -p /app/ovpn/config

echo "$(adddate) INFO: First remove files if exists"
#First remove files if exists
rm -rf ${OVPN_CONFIG_DIR}/ovpn*

echo "$(adddate) INFO: Curl download ovpn files from NordVPN"
#Curl download ovpn files from NordVPN
curl -s -o ${OVPN_CONFIG_DIR}/ovpn.zip ${OVPN_FILES}

echo "$(adddate) INFO: Unzip files"
#Unzip files
unzip -q ${OVPN_CONFIG_DIR}/ovpn.zip -d ${OVPN_CONFIG_DIR}

#Print out logging
if [ $? -eq 0 ]; then
    echo "$(adddate) INFO: OVPN files successfully unzipped to $OVPN_CONFIG_DIR"
else
    echo "$(adddate) ERROR: OVPN files unzipped failed!"
fi

echo "$(adddate) INFO: Remove current zip"
#Remove current zip
rm -rf ${OVPN_CONFIG_DIR}/ovpn.zip