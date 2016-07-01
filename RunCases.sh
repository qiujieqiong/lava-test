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
echo $CASE_ID
systemctl is-active lightdm >/dev/null && systemctl stop lightdm || true

env
ls /home
systemctl start lightdm
sleep 30
# wait for the launching of desktop till timeout
ps aux |grep dde-dock |grep -v grep
if [[ $? == 0 ]]; then
su - $AUTO_LOGIN_USER <<EOF

export DISPLAY=:0
env
echo $CASE_ID > casesID.txt
git clone https://github.com/qiujieqiong/lava-test
ls -ahl
groups
id
pip install --trusted-host pypi.douban.com -i http://pypi.douban.com/simple/ pyautogui
pybot lava-test/launcher.txt
cat test.result
EOF
fi
