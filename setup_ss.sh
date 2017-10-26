#!/bin/sh

# install python pip
sudo apt-get install -y python-pip

# install shadowsocks
sudo pip install shadowsocks

# set parameters
read -p "Enter your server ip: " SERVERIP
read -p "Enter your password: " PASSWORD

# create config file
echo "
{
    "\"server\":"\"$SERVERIP\",
    \"server_port\":8388,
    "\"local_address\": "\"127.0.0.1\",
    \"local_port\":1080,
    "\"password\":"\"$PASSWORD\",
    \"timeout\":300,
    "\"method\":"\"aes-256-cfb\",
    \"fast_open\": true
}
" | sudo tee --append /etc/shadowsocks.json

echo "Config File done!"

# Start shadowsocks
sudo ssserver -c /etc/shadowsocks.json -d start
