#!/bin/bash
set -x

echo "deepin	ALL=(ALL:ALL) ALL" >>/etc/sudoers
echo "deepin  ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers

id deepin
groups deepin
cat /etc/sudoers
