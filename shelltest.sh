#!/bin/bash
if [[ -z "AUTO_LOGIN_USER" ]]; then
    echo a user name must be given in order to login into destkop >&2
    exit 1    
fi

if [[ 0 != $UID ]]; then
    echo priveledged user is required >&2
    exit 1
fi

set -e
if [[ "$DEBUG" ]]; then
    PS4="> ${0##*/}: "
    set -x
fi

systemctl is-active lightdm >/dev/null && systemctl stop lightdm || true

trap 'eval $cleanup_acts' EXIT

# prepare end of laucnhing lock for notifying the test procedure is finished
eol_lock=$(mktemp -u /tmp/XXXXXX)
mkfifo "$eol_lock"
chown $AUTO_LOGIN_USER "$eol_lock"
cleanup_acts="unlink '$eol_lock'; $cleanup_acts"

# stop time measurement by autostart mechanism
echo "[Desktop Entry]
Name=End Of Launching Notification
Type=Application
Exec=/bin/bash -c '/bin/date +%%s.%%N >$eol_lock'
" >/etc/xdg/autostart/end-of-launching.desktop
cleanup_acts="unlink '/etc/xdg/autostart/end-of-launching.desktop'; $cleanup_acts"



# before launching DDE, drop pagecache
start_time=$(date +%s.%N)
echo 1 >/proc/sys/vm/drop_caches
systemctl start lightdm

# wait for the launching of desktop till timeout
read end_time <$eol_lock

duration=$(echo "$end_time-$start_time" | bc)

echo $end_time

echo $duration

ps aux |grep dde-dock|grep -v grep
ls -ahl /home
export DISPLAY=:0
ls -ahl /home/$AUTO_LOGIN_USER
cd /home/$AUTO_LOGIN_USER && git clone https://cr.deepin.io/autotest/dbus
env
python dbus/runall.py
set +x