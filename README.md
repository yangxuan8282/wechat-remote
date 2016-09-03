[中文](README-zh.md)

# wechat-remote
interact with your computer (such as RaspberryPi) via WeChat

This scripts based on [ItChat](https://github.com/littlecodersh/ItChat)

Modified from this [demo](https://github.com/littlecodersh/ItChat/issues/24#issuecomment-228583833)

It should support most commands you use in terminal, for instance `df -h` or `uname -a`

This [page](https://github.com/herrbischoff/awesome-command-line-apps) can give you some hints.

## What can it do

- remote download
- cast online video
- & more

## How to install

You should get itchat first:

```bash
git clone https://github.com/littlecodersh/ItChat
```

then `cd` into the folder, and download the scripts

```bash
cd ItChat
```

```bash
wget https://raw.githubusercontent.com/yangxuan8282/wechat-remote/filehelper/wechat_remote.py
```

run the scripts:

```bash
python wechat_remote.py
```

then scan the QR code to login

And you need more steps to use the function you want:

- download file ([aria2](https://aria2.github.io/))

on Debian/Raspbian:

```bash
sudo apt-get update&&sudo apt-get upgrade
```

```bash
sudo apt-get install aria2
```

install `diana`：

```bash
cd ~
```

```bash
git clone https://github.com/baskerville/diana
```

start：

```bash
dad start
```

download file：

```bash
diana add url
```

check downloading：

```bash
diana list
```

- download video ([youtube-dl](https://github.com/rg3/youtube-dl))

on Debian/Raspbian:

```bash
pip install youtube-dl
```

message sample:

```bash
youtube-dl url
```

- online video (mpv)

before install mpv you need insall FFmpeg or Libav

for FFmpeg, there is a guide in my [blog](https://www.zybuluo.com/yangxuan/note/374932#7-ffmpeg)

and mpv [installation](https://www.zybuluo.com/yangxuan/note/374932#8-mpv)

message sample:

```bash
mpv www.bilibili.com/video/av4306452/
```

- more

maybe you can use GPIO to remote control lighting


## Tips:
 - Some WeChat account can't send message to himself, you should use [filehelper](https://github.com/yangxuan8282/wechat-remote/tree/filehelper) branch, and send commmands to filehelper
 - User should avoid sending commmands like `aria2c` or `apt-get`, use wrapper instead, because the [docs](https://docs.python.org/3/library/subprocess.html#subprocess.Popen.communicate) for Popen.communicate [1] say explicitly: " Wait for process to terminate.", so new commands won't process until those commmands fininsed
