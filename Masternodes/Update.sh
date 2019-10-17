echo "Stopping dapscoind..."
dapscoin-cli stop
echo "Downloading update..."
wget https://github.com/DAPSCoin/DAPSCoin/releases/download/1.0.2/master_linux-v1.0.2.zip
echo "Extracting update..."
sudo unzip -jo master_linux-v1.0.2.zip -d /usr/local/bin
echo "Set permissions on files..."
sudo chmod +x /usr/local/bin/daps*
echo "Running dapscoind..."
dapscoind -daemon
echo "Update completed!"