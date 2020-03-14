cd
echo "Checking for updates..."
sudo apt update
echo "Applying any available upgrades..."
sudo apt upgrade -y
echo "Installing dependencies..."
sudo apt install build-essential libboost-dev libssl-dev -y
echo "Cloning Git Repo..."
git clone https://github.com/DAPSCoin/daps-seeder.git
echo "Building seeder..."
cd daps-seeder
make
echo "Installing to /usr/local/bin..."
cp dnsseed /usr/local/bin
echo "Done!"