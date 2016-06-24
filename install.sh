#!/bin/bash

echo "deepin  ALL=(ALL:ALL) ALL" >>/etc/sudoers
echo "deepin  ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers

cat /etc/sudoers