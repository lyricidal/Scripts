cd
sudo apt update
sudo apt upgrade -y
echo "Installing dependencies..."
sudo apt install build-essential libboost-dev libssl-dev -y
echo "Cloning Git Repo..."
git clone https://github.com/lyricidal/daps-seeder.git
echo "Building seeder..."
cd daps-seeder
make