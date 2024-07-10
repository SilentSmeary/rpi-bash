sudo apt install nala

sudo nala update
sudo nala upgrade -y

sudo nala remove transmission-gtk -y
sudo nala remove remmina -y
sudo nala remove gnome-snapshot -y

sudo nala install thonny -y 
sudo nala install python3-pandas -y
sudo nala install chromium-browser -y
sudo nala install okular -y

sudo nala install git -y

cd #
cd Downloads/
wget "https://github.com/shiftkey/desktop/releases/download/release-3.4.2-linux1/GitHubDesktop-linux-arm64-3.4.2-linux1.deb"
sudo dpkg -i GitHubDesktop-linux-arm64-3.4.2-linux1.deb

wget "https://download.jetbrains.com/webide/PhpStorm-2024.1.4-aarch64.tar.gz?_gl=1*nnqzli*_gcl_au*ODYyODQyMzU5LjE3MjA2Mjk2NTk.*_ga*MTc1MDU2NzIyMy4xNzIwNjI5NjYx*_ga_9J976DJZ68*MTcyMDYyOTY2MC4xLjEuMTcyMDYyOTczNC41NS4wLjA."
sudo tar -xvf PhpStorm-2024.1.4-aarch64.tar.gz
cd PhpStorm-241*
cd bin
bash phpstorm.sh

cd #

sudo nala update
sudo nala upgrade

sudo nala install apache2 -y

sudo systemctl enable apache2
sudo systemctl start apache2

sudo nala install mysql-server -y

sudo nala install php libapache2-mod-php php-mysql -y

php -v

sudo nala install phpmyadmin -y

sudo ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

sudo nala install sssd-ad -y
sudo nala install sssd-tools -y
sudo nala install realmd -y
sudo nala install adcli -y

sudo realm -v discover 193.228.225.131

PASSWORD="Password123@#!!"

echo $PASSWORD | sudo realm join -U demo 193.228.225.131

sudo apt autoremove -y

php -v