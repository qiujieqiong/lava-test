#!/bin/bash

usermod -aG sudo deepin
echo "deepin  ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers

cat /etc/sudoers