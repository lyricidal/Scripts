#!/bin/sh
clear
echo "Starting DAPS Bootstrap install script"
echo "Stopping dapscoind..."
dapscoin-cli stop
sleep 5
echo "Downloading Blocks folder..."
wget -N https://github.com/DAPSCoin/BootStrap/releases/download/latest/bootstrap.zip
echo "Downloading Chainstate folder..."
wget -N https://github.com/DAPSCoin/BootStrap/releases/download/latest/chainstate.zip
echo "Removing old blocks, chainstate, and database folders...."
rm -rf ~/.dapscoin/blocks ~/.dapscoin/chainstate ~/.dapscoin/database ~/.dapscoin/.lock ~/.dapscoin/dapscoind.pid
echo "Installing unzip..."
sudo apt-get install unzip -y
echo "Installing new blocks folders..."
unzip bootstrap.zip -d ~/.dapscoin
unzip chainstate.zip -d ~/.dapscoin
echo "Bootstrap installed!"