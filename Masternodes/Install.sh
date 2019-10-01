clear
echo "Starting DAPS Masternode download and install..."
echo "Updating/Upgrading OS..."
sudo apt update && sudo apt -y upgrade
echo "Downloading latest build..."
wget https://github.com/DAPSCoin/DAPSCoin/releases/download/1.0/dapscoin_linux-v1.0.0.zip
echo "Installing unzip
sudo apt-get install unzip
echo "Unzipping dapscoin_linux-v1.0.0.zip..."
sudo unzip dapscoin_linux-v1.0.0.zip -d /usr/local/bin
chmod +x /usr/local/bin/dapscoind
chmod +x /usr/local/bin/dapscoin-cli
chmod +x /usr/local/bin/dapscoin-qt
echo "Creating .dapscoin directory..."
mkdir ~/.dapscoin
cd ~/.dapscoin
echo "Editing dapscoin.conf..."
vi dapscoin.conf
echo "Launching dapscoind"
dapscoind -daemon