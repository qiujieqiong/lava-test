#!/bin/bash

set -x
id deepin
groups deepin
usermod -aG sudo deepin
id deepin
groups deepin
echo "deepin  ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers

cat /etc/sudoers