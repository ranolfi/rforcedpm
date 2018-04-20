rforcedpm - easy toggle between a videocard's power_dpm_force_performance_level with udev

Place the `rforcedpm` script in /usr/local/sbin and call it from Terminal to toggle between dynamic power management (dpm) power levels.

In addition, put `30-amdgpu-dpm-rx550.rules` in /etc/udev/rules.d to have *udev* set your videocard's dynamic power management (dpm) power level to `Low` on system startup.

This was developed as a workaround to a bug causing screen freeze with black or grey background with the Radeon RX 550 videocard using the AMDGPU kernel driver (https://bugzilla.redhat.com/show_bug.cgi?id=1478219) (also reported at https://bugs.freedesktop.org/show_bug.cgi?id=101976).
