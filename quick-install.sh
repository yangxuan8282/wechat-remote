#!/bin/bash
sudo apt-get install -y aria2 youtube-dl git python-dev python-pillow python-pip
if ! [[ -f /usr/bin/wechat-remote ]]; then
  git clone https://github.com/yangxuan8282/wechat-remote /tmp/wechat-remote
  git clone https://github.com/baskerville/diana /tmp/diana
  sudo pip install itchat
  sudo pip install subprocess32
  sudo install -Dm 755 /tmp/diana/dad /tmp/diana/diana /usr/bin
  sudo cp /tmp/wechat-remote/aria2.conf /etc/aria2.conf
  echo "Enter the aria2 download directory (full path) and press [ENTER]: "
  read dir
  sudo sed -i -e "s|dir=\$HOME|dir=$dir|g" /etc/aria2.conf
  sudo sed -i -e "s|input-file=.*|input-file=/var/aria2/session.lock|g" /etc/aria2.conf
  sudo sed -i -e "s|save-session=.*|input-file=/var/aria2/session.lock|g" /etc/aria2.conf
  sudo mkdir -p /var/aria2
  sudo touch /var/aria2/session.lock
  sudo cp /tmp/wechat-remote/aria2.service /etc/systemd/system
  sudo systemctl daemon-reload
  sudo systemctl enable aria2
  sudo systemctl start aria2
  sudo systemctl status aria2
  dad start
  sudo install -Dm 755 /tmp/wechat-remote/wechat_remote.py /usr/bin/wechat-remote
fi
