#!/bin/sh
# 
# Start Epiphany browser in kiosk mode
#
KICKFILE="/home/root/.config/kick-new-epiphany-config"
CONFIGFILE="/home/root/.config/epiphany-config"
CONFIGDIR="/home/root/.config/"
CHECKDELAY=1

while true
do
  if [ ! -f ${KICKFILE} ]
  then
    sleep ${CHECKDELAY}
  else
    killall -9 epiphany
    killall -9 matchbox-keyboard
    sleep 10
    newhomepage="`cat ${CONFIGFILE} | grep ^homepage= | sed 's/^homepage=//'`"
    echo starting epiphany with new homepage: ${newhomepage}
    WEBKIT_DISABLE_TBS=1 epiphany -a -i --profile ~/.config ${newhomepage} --display=:0 &
    matchbox-keyboard -d &
    echo started new epiphany
    sleep 5s;
    xdotool key "F11"
    rm -f ${KICKFILE}
  fi
done
