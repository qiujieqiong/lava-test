#!/bin/bash
set -x
cat /etc/lightdm/lightdm.conf.d/auto-login.conf
echo $AUTO_LOGIN_USER
echo "deepin  ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers
id deepin
groups deepin
cat /etc/sudoers
