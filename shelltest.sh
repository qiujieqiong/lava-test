#!/bin/bash

ls -ahl /home
cd /home/AUTO_LOGIN_USER && sudo xauth generate :0 . trusted
ls -ahl /home/AUTO_LOGIN_USER
env
export DISPLAY=:0
env
