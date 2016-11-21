#!/bin/sh

KICKFILE="/home/root/.config/kick-new-epiphany-config"
CONFIGFILE="/home/root/.config/epiphany-config"

usage()
{
  echo "Usage: $0 <new url>"
  exit 1
}

if [ $# -lt 1 ]
then
  usage
fi

URL=$1

sed -i "s|^homepage=.*$|homepage=${URL}|g" ${CONFIGFILE}
touch ${KICKFILE}
