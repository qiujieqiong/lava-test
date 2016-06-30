#!/bin/bash

set -x
id deepin
groups deepin
usermod -aG sudo deepin
id deepin
groups deepin
whereis chpasswd
echo $1 |chpasswd
