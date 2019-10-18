echo "Stopping dapscoind..."
dapscoin-cli stop
sleep 5
echo "Downloading bootstrap..."
wget -N https://github.com/DAPSCoin/BootStrap/releases/download/latest/bootstrap.zip
echo "Removing old blocks, chainstate, and database folders...."
rm -rf ~/.dapscoin/blocks ~/.dapscoin/chainstate ~/.dapscoin/database ~/.dapscoin/.lock ~/.dapscoin/dapscoind.pid
echo "Installing new blocks folders..."
unzip bootstrap.zip -d ~/.dapscoin
echo "Bootstrap installed!"