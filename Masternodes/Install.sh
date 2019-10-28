#!/bin/sh
clear
echo "Starting DAPS Masternode download and install script"
echo "Updating/Upgrading OS..."
sudo apt update && sudo apt upgrade -y
echo "Downloading latest build..."
wget -N https://github.com/DAPSCoin/DAPSCoin/releases/download/1.0.3/master_linux-v1.0.3.4.zip
echo "Installing unzip..."
sudo apt-get install unzip -y
echo "Unzipping latest zip..."
sudo unzip -jo master_linux-v1.0.3.4.zip -d /usr/local/bin
sudo chmod +x /usr/local/bin/dapscoin*
echo "Creating .dapscoin directory..."
mkdir ~/.dapscoin
cd ~/.dapscoin
echo "Editing dapscoin.conf..."
echo rpcuser= >> dapscoin.conf
echo rpcpassword= >> dapscoin.conf
echo rpcallowip=127.0.0.1 >> dapscoin.conf
echo server=1 >> dapscoin.conf
echo daemon=1 >> dapscoin.conf
echo staking=0 >> dapscoin.conf
echo logtimestamps=1 >> dapscoin.conf
echo maxconnections=256 >> dapscoin.conf
echo masternode=1 >> dapscoin.conf
echo externalip= >> dapscoin.conf
echo masternodeprivkey= >> dapscoin.conf
vi dapscoin.conf >> dapscoin.conf
echo "Setting up and enabling fail2ban..."
sudo apt-get install fail2ban -y
sudo ufw allow ssh
sudo ufw allow 53572
sudo ufw allow 53573
sudo ufw enable
echo "Launching dapscoind..."
dapscoind -daemon
echo "Cleaning up..."
cd
rm -rf master_linux-v1.0.3.4.zip
echo "DAPS Masternode installed succesfully!"