#!/usr/bin/expect
spawn passwd deepin
expect "password:"
send "newpassword\n"
expect "password:"
send "newpassword\n"
interact
