#!/bin/bash
sudo apt-get install -y aria2 youtube-dl git python-dev python-pillow python-pip
if ! [[ -f /usr/bin/wechat-remote ]]; then
  git clone https://github.com/yangxuan8282/wechat-remote /tmp/wechat-remote
  git clone https://github.com/baskerville/diana /tmp/diana
  sudo pip install itchat
  sudo pip install subprocess32
  sudo cp /tmp/diana/diana /usr/bin
  sudo cp /tmp/diana/dad /usr/bin
  sudo chmod 755 /usr/bin/dad /usr/bin/diana
  mkdir -p $HOME/.config/aria2
  cp aria2.conf $HOME/.config/aria2/aria2.conf
  touch $HOME/.config/aria2/session.lock
  sudo cp aria2.service /etc/systemd/user
  systemctl --user start aria2
  systemctl --user enable aria2  
  dad start
  sudo cp /tmp/wechat-remote/wechat_remote.py /usr/bin/wechat-remote
  sudo chmod 755 /usr/bin/wechat-remote
fi
