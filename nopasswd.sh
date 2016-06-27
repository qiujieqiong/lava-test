#!/bin/bash

usermod -aG deepin sudo
echo "deepin  ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers

cat /etc/sudoers