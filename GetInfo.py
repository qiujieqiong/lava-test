#!/usr/bin/env python
#encoding:utf-8

import sys
import ConfigParser
import os
import subprocess
#import testlink
from pykeyboard import PyKeyboard
from pymouse import PyMouse

k = PyKeyboard()
m = PyMouse()

class GetInfo:
	
	def __init__(self):
		self.userPath = os.path.expanduser('~')

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

