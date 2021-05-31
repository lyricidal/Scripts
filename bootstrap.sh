#!/bin/sh
clear
echo "Starting Rapids Bootstrap install script"
echo "Stopping rapidsd..."
rapids-cli stop
sleep 5
echo "Downloading BootStrap..."
wget -N https://bootstrap.prcycoin.com/bootstrap.zip
echo "Removing old blocks, chainstate, database, sporks, and zerocoin folders...."
rm -rf ~/.rapids/blocks ~/.rapids/chainstate ~/.rapids/database ~/.rapids/.lock ~/.rapids/rapids.pid ~/.rapids/sporks ~/.rapids/zerocoin
echo "Installing unzip..."
sudo apt-get install unzip -y
echo "Installing new blocks/chainstate/sporks/zerocoin folders..."
unzip -o bootstrap.zip -d ~/.rapids
echo "Bootstrap installed!"
