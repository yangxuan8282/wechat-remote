# wechat-remote
通过微信远程控制电脑 (比如树莓派) 

基于 [ItChat](https://github.com/littlecodersh/ItChat) 框架；另外这个框架有一个 [robot](https://github.com/littlecodersh/ItChat/tree/robot) 分支，可做聊天机器人

在这个[demo](https://github.com/littlecodersh/ItChat/issues/24#issuecomment-228583833)的基础上修改而成

## 功能

- 远程下载(aria2)
- 远程下载在线视频(youtube-dl)
- 播放在线视频(mpv)
- 更多

## 安装

需先下载 `itchat` 框架

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

扫码登陆后可以操作了（有些微信账号无法给自己发送消息，需用其它账号发送）

下面具体说一下需要不同功能该如何安装配置

- 远程下载 ([aria2](https://aria2.github.io/))

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

- 下载视频 (youtube-dl)

先安装 `youtube-dl`

```bash
pip install youtube-dl
```

然后给自己的账号发送指令就可以下载了

```bash
youtube-dl url
```

另一个视频下载的选择是 [you-get](https://github.com/soimort/you-get)

- 播放在线视频 (mpv)

安装 `mpv` 前需先安装FFmpeg，链接里有[步骤](https://www.zybuluo.com/yangxuan/note/374932#7-ffmpeg)

mpv 的[安装](https://www.zybuluo.com/yangxuan/note/374932#8-mpv)

安装完之后就可以观看视频了，比如B站

```bash
mpv www.bilibili.com/video/av4306452/
```


- 更多

或许可以通过GPIO控制用电器


