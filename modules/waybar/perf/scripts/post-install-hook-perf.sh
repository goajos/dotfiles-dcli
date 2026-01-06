#!/usr/bin/env bash

mkdir -p /etc/udev/rules.d/
cp -r -u ./modules/waybar/perf/99-turbostat.rules /etc/udev/rules.d/99-turbostat.rules
getent group msr || groupadd -r msr
usermod -a -G msr jappe
if [ -f /usr/bin/intel_gpu_top ]; then
    setcap cap_perfmon=+ep /usr/bin/intel_gpu_top;
fi
if [ -f /usr/bin/turbostat ]; then
    setcap cap_sys_admin,cap_sys_rawio,cap_sys_nice=+ep /usr/bin/turbostat;
fi
udevadm control -R
