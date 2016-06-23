#!/usr/bin/expect -f

spawn sudo pip install pyautogui
expect "deepin:"
send "\n" 
interact