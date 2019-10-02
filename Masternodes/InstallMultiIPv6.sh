clear
echo "Starting DAPS Masternode download and install..."
echo "Updating/Upgrading OS..."
sudo apt update && sudo apt upgrade -y
echo "Downloading latest build..."
wget https://github.com/DAPSCoin/DAPSCoin/releases/download/1.0/dapscoin_linux-v1.0.0.zip
echo "Installing unzip..."
sudo apt-get install unzip -y
echo "Unzipping dapscoin_linux-v1.0.0.zip..."
sudo unzip dapscoin_linux-v1.0.0.zip -d /usr/local/bin
echo "Creating copies of dapscoind..."
sudo cp /usr/local/bin/dapscoind /usr/local/bin/dapscoind00
sudo mv /usr/local/bin/dapscoind /usr/local/bin/dapscoind01
sudo mv /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind02
sudo mv /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind03
sudo mv /usr/local/bin/dapscoind00 /usr/local/bin/dapscoind04
echo "Creating copies of dapscoin-cli..."
sudo mv /usr/local/bin/dapscoin-cli /usr/local/bin/dapscoin-cli00
sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli01
sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli02
sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli03
sudo cp /usr/local/bin/dapscoin-cli00 /usr/local/bin/dapscoin-cli04
sudo chmod +x /usr/local/bin/daps*
echo "Creating .dapscoin directories..."
mkdir ~/.dapscoin00
mkdir ~/.dapscoin01
mkdir ~/.dapscoin02
mkdir ~/.dapscoin03
mkdir ~/.dapscoin04