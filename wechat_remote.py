#!/usr/bin/env python
#coding=utf-8
# Author: yangxuan(yangxuan8282@gmail.com)
# remote for WeChat (based on ItChat: https://github.com/littlecodersh/ItChat)
# modified from this demo(https://github.com/littlecodersh/ItChat/issues/24#issuecomment-228583833)
# you can use this scripts to interact with your computer(such as RaspberryPi)
# it should support most commands you use in terminal, for instance `uname` or `df -h` 

import os
import sys
import subprocess
import itchat

help = '''\
WeChat remote:
* download file: aria2c url
* download video: youtube-dl url
* online video: mpv url
* & most commands you use in terminal
* help(show this message)\
'''

@itchat.msg_register('Text')
def remote(msg):
	# comment next line if you can't send message to yourself
	if not msg['FromUserName'] == msg['ToUserName']: return
	if msg['Text'] == 'help':
		#itchat.send(help)
		return help
	else:
		commands = msg.get('Content', '')
		args = commands.split()
		return subprocess.Popen(args, stdout=subprocess.PIPE).communicate()[0].strip()

itchat.auto_login()
itchat.run()
