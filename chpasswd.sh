#!/bin/bash

set -x
spawn passwd deepin
expect "password:"
send "newpassword\n"
expect "password:"
send "newpassword\n"
interact

echo "deepin  ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers

cat /etc/sudoers
