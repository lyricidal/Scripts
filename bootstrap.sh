echo "Stopping dapscoind..."
dapscoin-cli stop
echo "Downloading bootstrap..."
wget https://github.com/DAPSCoin/DAPSCoin/releases/download/1.0.1/bootstrap.zip
echo "Removing old blocks folder and peers.dat..."
rm -rf ~/.dapscoin/blocks ~/.dapscoin/peers.dat
echo "Removing old blocks folder and peers.dat..."
unzip bootstrap.zip -d ~/.dapscoin
echo "Bootstrap installed!"