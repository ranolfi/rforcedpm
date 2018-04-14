#!/usr/bin/env bash
#
# rforcedpm - easy toggle between a videocard's power_dpm_force_performance_level with udev
#
# Marc Ranolfi, 2018-04-13 <mranolfi@gmail.com>
#
# Inspired by a bug with Radeon RX 550 driver <https://bugzilla.redhat.com/show_bug.cgi?id=1478219>
#

if cat /sys/class/drm/card0/device/power_dpm_force_performance_level | grep -qs high
then
  echo -e "DPM status is <High>.\n"
  echo "Switch to <Low>? [y/N] "

  read response
  if [[ $response == "y" ]]
  then
    sudo sh -c "echo 'low' > /sys/class/drm/card0/device/power_dpm_force_performance_level"
  fi

else
  echo -e "DPM status is <Low>.\n"
  echo "Switch to <High>? [y/N] "

  read response
  if [[ $response == "y" ]]
  then
    sudo sh -c "echo 'high' > /sys/class/drm/card0/device/power_dpm_force_performance_level"
  fi
fi
