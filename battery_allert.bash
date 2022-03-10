#/bin/bash

#Set maximum battery level
MAXIMUM=70

#Getting battery level and status
CAPACITY=$(cat /sys/class/power_supply/BAT1/capacity)
STATUS=$(cat /sys/class/power_supply/BAT1/uevent | grep POWER_SUPPLY_STATUS | sed -e 's/POWER_SUPPLY_STATUS=//g')

# Check if maximum reached and play alert
if [[ $CAPACITY -ge  $MAXIMUM ]]; then
  if [[ $STATUS == Charging ]]; then
    echo "RING-RING"
    play /usr/share/sounds/Oxygen-K3B-Finish-Error.ogg
  fi
fi
