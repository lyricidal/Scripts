#!/bin/sh
VERSION=1.0.8.1

clear
echo "Starting DAPS Masternode download and install script"
echo "Updating/Upgrading OS..."
sudo apt update && sudo apt upgrade -y
echo "Downloading latest build..."
wget -N https://github.com/DAPSCoin/DAPSCoin/releases/download/$VERSION/dapscoin-v$VERSION-linux.zip
echo "Installing unzip..."
sudo apt-get install unzip -y
echo "Unzipping latest zip..."
sudo unzip -jo dapscoin-v$VERSION-linux.zip -d /usr/local/bin
sudo chmod +x /usr/local/bin/dapscoin*
echo "Creating .dapscoin directory..."
mkdir ~/.dapscoin
cd ~/.dapscoin
echo "Editing dapscoin.conf..."
IP=$(ip a s eth0 | awk '/inet / {print$2}' | cut -d/ -f1)
echo rpcuser=user`shuf -i 100000-10000000 -n 1` >> dapscoin.conf
echo rpcpassword=pass`shuf -i 100000-10000000 -n 1` >> dapscoin.conf
echo rpcallowip=127.0.0.1 >> dapscoin.conf
echo server=1 >> dapscoin.conf
echo daemon=1 >> dapscoin.conf
echo listen=1 >> dapscoin.conf
echo staking=0 >> dapscoin.conf
echo logtimestamps=1 >> dapscoin.conf
echo masternode=1 >> dapscoin.conf
echo externalip=$IP:53572 >> dapscoin.conf
echo masternodeaddr=$IP:53572 >> dapscoin.conf
echo bind=$IP:53572 >> dapscoin.conf
echo masternodeprivkey= >> dapscoin.conf
vi dapscoin.conf >> dapscoin.conf
echo "Setting up and enabling fail2ban..."
sudo apt-get install fail2ban -y
sudo ufw allow ssh
sudo ufw allow 53572
sudo ufw allow 53573
sudo ufw enable

echo "Do you want to download and install the latest BootStrap? [y/n]"
read BOOTSTRAP

if [[ $BOOTSTRAP =~ "y" ]] ; then
  echo "Downloading BootStrap..."
  wget -N https://bootstrap.dapscoin.com/bootstrap.zip
  echo "Removing old blocks, chainstate, and database folders...."
  rm -rf ~/.dapscoin/blocks ~/.dapscoin/chainstate ~/.dapscoin/database ~/.dapscoin/.lock ~/.dapscoin/dapscoind.pid
  echo "Installing new blocks/chainstate folders..."
  unzip -o bootstrap.zip -d ~/.dapscoin
  echo "Bootstrap installed!"
fi

echo "Launching dapscoind..."
dapscoind -daemon
echo "Cleaning up..."
cd
rm -rf dapscoin-v$VERSION-linux.zip
echo "DAPS Masternode installed successfully!"
