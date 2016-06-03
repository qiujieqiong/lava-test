#!/bin/bash

ls -ahl /home
xauth generate :0 . trusted
ls -ahl /home
env
export DISPLAY=:0
env
