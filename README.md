[中文](README-zh.md)

# wechat-remote
interact with your computer (such as RaspberryPi) via WeChat 

This scripts based on [ItChat](https://github.com/littlecodersh/ItChat)

Modified from this [demo](https://github.com/littlecodersh/ItChat/issues/24#issuecomment-228583833)

It should support most commands you use in terminal, for instance apt-get update&&apt-get upgrade

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
wget https://raw.githubusercontent.com/yangxuan8282/wechat-remote/master/wechat_remote.py
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

then after login, you can download file with send message to you WeChat account:

```bash
aria2c url
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




