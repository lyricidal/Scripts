echo "Stopping dapscoind..."
dapscoin-cli stop
echo "Downloading bootstrap..."
wget https://github.com/DAPSCoin/BootStrap/releases/download/latest/bootstrap.zip
echo "Removing old blocks, chainstate, and database folders...."
rm -rf ~/.dapscoin/blocks ~/.dapscoin/chainstate ~/.dapscoin/database
echo "Installing new blocks folders..."
unzip bootstrap.zip -d ~/.dapscoin
echo "Bootstrap installed!"