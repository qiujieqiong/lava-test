#!/usr/bin/env python
#encoding:utf-8

import sys
import ConfigParser
import os
import subprocess
import pyautogui
from pykeyboard import PyKeyboard
from pymouse import PyMouse

k = PyKeyboard()
m = PyMouse()

class GetInfo:

	def __init__(self):
		self.userPath = os.path.expanduser('~')
		self.screenWidth, self.screenHeight = pyautogui.size()

	def getCenterScreenCoor(self):
		return (self.screenWidth/2, self.screenHeight/2)

	def getlauncherCoor(self):
		width_dock = 760
		height_dock = 70
		item_dock = 14
		width_item = 52
		height_item = 52
		height_dock_blank = height_dock-height_item
		start = (self.screenWidth-width_dock)/2
		width_dock_blank = (width_dock-item_dock*width_item)/2
		launcher_x = start+width_dock_blank+width_item/2
		launcher_y = self.screenHeight-height_dock+height_item/2
		return (launcher_x,launcher_y)

	def getIconInLauncher(self):
		up = 150
		left = 220
		width_item = height_item = 140
		item_x = left+width_item/2
		item_y = up+height_item/2
		return (item_x,item_y)

	def getHotAreaLauncherCoor(self):
		up = 973
		left = 30
		width_item = 50
		height_item = 26
		item_x = left+width_item/2
		item_y = up+height_item/2
		return (item_x,item_y)

	def getUninstallBtnCoor(self):
		up = 432
		left = 760
		width_item = 380
		height_item = 137
		item_x = left+width_item*3/4
		item_y = up+height_item-26/2
		return (item_x,item_y)

	def getClassificationIconCoor(self):
		up = 46
		left = 22
		width_item = height_item = 20
		item_x = left+width_item/2
		item_y = up+height_item/2
		return (item_x,item_y)

	def getDockBottomCoor(self):
		item_x = self.screenWidth/2
		item_y = self.screenHeight-10
		return (item_x,item_y)

	def getUserPath(self):
		self.userPath = os.path.expanduser('~')
		return self.userPath


	def send_single_key(self,key):
		k.press_key(key)
		k.release_key(key)

	def click(self,x,y):
		m.press(x,y)
		m.release(x,y)

	def right_click(self,x,y):
		m.press(x,y,2)
		m.release(x,y,2)

	def getCasesID(self):
		#casesID = os.environ["CASE_ID"]
		IDfile = self.userPath+'/casesID.txt'
		if os.path.exists(IDfile):
			ID_obj = open(IDfile,'r')
			ID_content = ID_obj.read().strip('\n')
			ID_obj.close()
			return ID_content.split(",")


	def appendContent(self,content):
		result_obj = open('test.result','a')
		result_obj.write(content+'\n')
		result_obj.close()
