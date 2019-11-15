cd
echo "Installing dependencies..."
sudo apt install libboost-dev libssl-dev -y
echo "Cloning Git Repo..."
git clone https://github.com/lyricidal/pivx-seeder.git
echo "Building seeder..."
cd pivx-seeder
make