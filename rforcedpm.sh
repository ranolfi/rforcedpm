#!/usr/bin/env bash
#
# rforcedpm - easy toggle between a videocard's power_dpm_force_performance_level with udev
#
# Marc Ranolfi, 2018-04-13 <mranolfi@gmail.com>
#
# Inspired by a bug with Radeon RX 550 driver <https://bugzilla.redhat.com/show_bug.cgi?id=1478219>
#
# Caveat: Assumes a single videocard is installed in the system.
#

STATE=$(cat /sys/class/drm/card0/device/power_dpm_force_performance_level)

echo -e "DPM status is <$STATE>.\n"

echo "Select an option, or press [Enter] to quit."

if [[ $STATE == "auto" ]]
then
  echo "1. <low>"
  echo "2. <high>"
elif [[ $STATE == "low" ]]
then
  echo "1. <auto>"
  echo "2. <high>"
else
  echo "1. <auto>"
  echo "2. <low>"
fi

read RESPONSE
CHANGE_TO=""

if [[ $STATE == "auto" ]] && [[ $RESPONSE == "1" ]]; then CHANGE_TO="low"
elif [[ $STATE == "auto" ]] && [[ $RESPONSE == "2" ]]; then CHANGE_TO="high"
elif [[ $STATE == "low" ]] && [[ $RESPONSE == "1" ]]; then CHANGE_TO="auto"
elif [[ $STATE == "low" ]] && [[ $RESPONSE == "2" ]]; then CHANGE_TO="high"
elif [[ $STATE == "high" ]] && [[ $RESPONSE == "1" ]]; then CHANGE_TO="auto"
elif [[ $STATE == "high" ]] && [[ $RESPONSE == "2" ]]; then CHANGE_TO="low"
fi

if [ ! -z "$CHANGE_TO" ]
then
  sudo sh -c "echo '$CHANGE_TO' > /sys/class/drm/card0/device/power_dpm_force_performance_level"
  echo "DPM status set to <$CHANGE_TO>."
fi
