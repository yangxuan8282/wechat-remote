#!/bin/bash
sudo apt-get install -y aria2 youtube-dl git python-dev python-pillow python-pip
if ! [[ -f /usr/bin/wechat-remote ]]; then
  git clone https://github.com/yangxuan8282/wechat-remote /tmp/wechat-remote
  git clone https://github.com/baskerville/diana /tmp/diana
  sudo pip install itchat
  sudo cp /tmp/diana/diana /usr/bin
  sudo cp /tmp/diana/dad /usr/bin
  sudo chmod 755 /usr/bin/dad /usr/bin/diana
  mkdir -p ~/.aria2/aria2
  touch ~/.aria2/aria2.session
  sudo cp /tmp/wechat-remote/aria2.conf ~/.config/.aira2/
  sudo cp /tmp/wechat-remote/aria2c /etc/init.d/aria2c
  sudo chmod +x /etc/init.d/aria2c
  sudo service aria2c restart
  sudo cp /tmp/wechat-remote/wechat_remote.py /usr/bin/wechat-remote
  sudo chmod 755 /usr/bin/wechat-remote
fi
