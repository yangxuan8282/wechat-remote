#!/usr/bin/env python
#coding=utf-8
# Author: yangxuan(yangxuan8282@gmail.com)
# remote for WeChat (based on ItChat: https://github.com/littlecodersh/ItChat)
# modified from this demo(https://github.com/littlecodersh/ItChat/issues/24#issuecomment-228583833)
# you can use this scripts to interact with your computer(such as RaspberryPi)
# it should support most commands you use in terminal, for instance `uname` or `df -h`

import os
import sys
#import subprocess
import itchat
import time

if os.name == 'posix' and sys.version_info[0] < 3:
	import subprocess32 as subprocess
else:
	import subprocess

help = '''\
WeChat remote:
* download file: diana add url
* download video: youtube-dl url
* online video: mpv url
* & most commands you use in terminal
* help(show this message)\
'''

@itchat.msg_register('Text')
def remote(msg):

	if not msg['FromUserName'] == msg['ToUserName']: return  # comment this line if you can't send message to yourself
	if msg['Text'] in ['help', u'帮助']:
		return help
	else:
		commands = msg.get('Content', '')
		args = commands.split()

		# Custom aliases
		if args[0] == 'bilidan':
			args[0] = '/home/pi/BiliDan/bilidan.py'

		if args[0] == 'dad':
			args[0] = '/home/pi/diana/dad'

		if args[0] == 'diana':
			args[0] = '/home/pi/diana/diana'

		try:
			proc =  subprocess.Popen(args,
									# shell=True,
									# executable='/bin/bash',
									# stderr=subprocess.PIPE,
									stdout=subprocess.PIPE)
			return proc.communicate()[0].strip()
		except OSError as e:
			return u'Commands/Files not found'


itchat.auto_login(enableCmdQR = True, hotReload = True)
itchat.run()
