# wechat-remote
通过微信远程控制电脑 (比如树莓派) 

- 利用网页版微信通信协议向树莓派发送指令，类似一个非实时的终端交互
- 相比其它微信远程而言，这个脚本可以适用于普通微信号
- 适用于无公网IP的情况下远程发送命令

测试可用系统为： `RASPBIAN JESSIE`

测试硬件为： `树莓派3`

另外无头派(未连接显示器的 RPi )似乎无法登陆 `ItChat`

基于 [ItChat](https://github.com/littlecodersh/ItChat) 框架；另外这个框架有一个 [robot](https://github.com/littlecodersh/ItChat/tree/robot) 分支，可做聊天机器人

在这个[demo](https://github.com/littlecodersh/ItChat/issues/24#issuecomment-228583833)的基础上修改而成

## 功能

- 远程下载(aria2)
- 远程下载在线视频(youtube-dl)
- 播放在线视频(mpv)
- 更多

## 安装

安装 `subprocess32` 模块

```bash
sudo apt-get install python-dev
```

```bash
sudo pip install subprocess32
```

下载 `itchat` 框架

```bash
git clone https://github.com/littlecodersh/ItChat
```

然后 `cd` 到目录内, 并下载脚本

```bash
cd ItChat
```

```bash
wget https://raw.githubusercontent.com/yangxuan8282/wechat-remote/master/wechat_remote.py
```

运行脚本：

```bash
python wechat_remote.py
```

建议在 `screen` 内运行：

```bash
sudo apt-get install screen
```
  
```bash
screen bash
```

```
python wechat_remote.py
```

扫码登陆后可以操作了（有些微信账号无法给自己发送消息，需用其它账号发送）

下面具体说一下需要不同功能该如何安装配置


1. 远程下载 ([aria2](https://aria2.github.io/))

	先安装 `aria2`：

	```bash
	sudo apt-get update && sudo apt-get upgrade
	```

	```bash
	sudo apt-get install aria2
	```

	然后就可以给登陆的微信号发送指令来进行下载，比如：

	```bash
	aria2c url
	```
	
	如果想看下载进度可以利用 `diana`：
	
	下载：
	
	```bash
	cd ~
	```
	
	```bash
	git clone https://github.com/baskerville/diana
	```
	
	启动：
	
	```bash
	dad start
	```
	
	通过微信添加下载：
	
	```bash
	diana add url
	```
	
	通过微信查看下载进度：
	
	```bash
	diana list
	```


2. 下载视频 (youtube-dl)

	先安装 `youtube-dl`

	```bash
	pip install youtube-dl
	```

	然后给自己的账号发送指令就可以下载了

	```bash
	youtube-dl url
	```

	查看可选的清晰度

	```bash
	youtube-dl -F url
	```

	下载选定的清晰度（返回的信息可能较长）

	```bash
	youtube-dl -f args url
	```

	另一个视频下载的选择是 [you-get](https://github.com/soimort/you-get)


3. 播放在线视频 

	- `omxplayer` + `you-get`

 		测试可用站点：Youtube
   
 		先安装 `you-get`

 		```bash
 		sudo pip3 install you-get
 		```

 		播放指令：

 		```bash
 		you-get -p omxplayer url
 		```

 		相较 `mpv` 而言，`omxplayer` 效率更高，但是由于有些指令可能无法像在终端内一样执行，比如调用 `youtube-dl` 获取视频地址，然后让 `omxplayer` 播放的指令：

 		```bash
 		omxplayer $(youtube-dl -g url)
 		```

 		就没法成功播放，只能通过 `you-get` 调用播放器；国内的站点能成功播放的较少

 		`you-get`获取视频地址的速度比 `youtube-dl` 慢一些，需要耐心等待

 	- `mpv` 

 		测试可用站点：Youtube，Bilibili

 		播放高清比较吃力，但适用范围广

 		安装 `mpv` 前需先安装FFmpeg，链接里有[步骤](https://www.zybuluo.com/yangxuan/note/374932#7-ffmpeg)

 		mpv 的[安装](https://www.zybuluo.com/yangxuan/note/374932#8-mpv)

 		如需播放在线视频必须在本机上运行脚本，不能通过SSH，否则会报错

 		安装完之后就可以观看视频了，比如B站

 		```bash
 		mpv www.bilibili.com/video/av4306452/
 		```
 	- `BiliDan`	
 	
		看 `Bilibili` 的另一个选择。同样是调用 `mpv` 最大特点是可以选择清晰度

		依然先按教程安装 [mpv](https://www.zybuluo.com/yangxuan/note/374932#8-mpv) 及 [FFmpeg](https://www.zybuluo.com/yangxuan/note/374932#7-ffmpeg)
		
		之后下载 `Bilidan` 及 `Danmaku2ASS` 到相同目录：

		```bash
		git clone https://github.com/m13253/BiliDan
		```
		
		```bash
		cd BiliDan
		```
		
		```bash
		wget https://raw.githubusercontent.com/m13253/danmaku2ass/master/danmaku2ass.py
		```
		
		命令示例：
		
		```bash
		bilidan -q 2 http://www.bilibili.com/video/av1250502/
		```
		
		关闭弹幕按 <kbd>v</kbd>

		
4. 更多

	或许可以通过GPIO控制用电器


## Tips:

对于没有安装的 `.py` 文件，比如上面例子里的 `dad`、 `diana`、 `bilidan`， 如果想省略输入绝对路径，可在 `wechat_remote.py` 文件内自定义。
在脚本内修改是因为添加 `PATH` 或是自定义 `aliases` 在 `subprocess` 内均失效， 而启用  `shell=True` 的返回结果与预期并不一致 


## 相关项目：

- [树莓派-微信音乐播放器](https://github.com/yaphone/RasWxMusicbox)：通过微信控制树莓派播放音乐


## Issues

- 通信相关的问题请到ItChat的 [Issues](https://github.com/littlecodersh/ItChat/issues) 反馈
- 默认只处理自己账号发送来的指令，如需修改请注释掉 `wechat_remote.py` 文件的第[32](https://github.com/yangxuan8282/wechat-remote/blob/master/wechat_remote.py#L32)行
- 部分微信账号可能无法给自己发送信息，需用其它账号发送指令
- 长时间上线可能会掉线，目前没有掉线提示
- 不要发送 `apt-get` 相关指令，因为目前还没加入终止之前进程的功能
- 网页版微信协议的分析过程在 ItChat 作者的这个[页面](https://github.com/littlecodersh/ItChat/blob/master/docs/Tutorial/Tutorial1.md)有讲解
