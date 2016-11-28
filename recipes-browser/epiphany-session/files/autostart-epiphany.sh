#!/bin/sh
# 
# Start Epiphany browser in kiosk mode
#
KICKFILE="/home/root/.config/kick-new-epiphany-config"
CONFIGFILE="/home/root/.config/epiphany-config"
CONFIGDIR="/home/root/.config/epiphany"
CHECKDELAY=1

while true
do
  if [ ! -f ${KICKFILE} ]
  then
    sleep ${CHECKDELAY}
  else
    rm -rf '${CONFIGDIR}/*'
    killall -9 epiphany
    killall -9 matchbox-keyboard
    xmodmap -e "pointer = 1 2 99"
    export DISPLAY=:0
    sleep 10
    newhomepage="`cat ${CONFIGFILE} | grep ^homepage= | sed 's/^homepage=//'`"
    echo starting epiphany with new homepage: ${newhomepage}
    epiphany -i --profile ${CONFIGDIR} ${newhomepage} &
    matchbox-keyboard --daemon &
    echo started new epiphany
    sleep 3
    xdotool key "F11" &
    rm -f ${KICKFILE}
  fi
done
