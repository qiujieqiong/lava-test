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


systemctl start lightdm
sleep 10
# wait for the launching of desktop till timeout
ps aux |grep dde-dock |grep -v grep
if [[ $? -ne 0 ]]]; then
su - $AUTO_LOGIN_USER <<EOF
export DISPLAY=:0
env 
cd /home/$AUTO_LOGIN_USER
git clone https://github.com/qiujieqiong/testlink-robotframework-integration
ls -ahl /home/$AUTO_LOGIN_USER
cd testlink-robotframework-integration/checklist/launcher
pybot -i start_up launcher.txt
EOF
fi
