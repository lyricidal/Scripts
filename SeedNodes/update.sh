echo "Updating/Upgrading OS..."
sudo apt update && sudo apt upgrade -y
cd daps-seeder
echo "Pulling Latest Source From GitHub..."
git pull
echo "Compiling..."
make
echo "Stopping Service..."
sudo systemctl stop daps-seeder.service
echo "Stopping Service..."
sudo cp dnsseed /usr/local/bin
echo "Stopping Service..."
sudo systemctl start daps-seeder.service
echo "DAPS Seed Node updated successfully!"