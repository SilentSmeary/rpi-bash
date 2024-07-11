RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
NC='\033[0m' # No Color

sudo apt install nala

echo -e "${GREEN}[INSTALLED]${NC} Nala"

sudo nala update
sudo nala upgrade -y

echo -e "${YELLOW}[UPGRADE]${NC} System"

sudo nala remove transmission-gtk -y
sudo nala remove remmina -y
sudo nala remove gnome-snapshot -y

echo -e "${RED}[REMOVED]${NC} Transmission"
echo -e "${RED}[REMOVED]${NC} Remmina"
echo -e "${RED}[REMOVED]${NC} Camera"

sudo nala install thonny -y 
sudo nala install python3-pandas -y
sudo nala install chromium-browser -y
sudo nala install okular -y
sudo nala install git -y


echo -e "${GREEN}[INSTALLED]${NC} Thonny"
echo -e "${GREEN}[INSTALLED]${NC} Pandas"
echo -e "${GREEN}[INSTALLED]${NC} Chormium Browser"
echo -e "${GREEN}[INSTALLED]${NC} Okular"
echo -e "${GREEN}[INSTALLED]${NC} Git"

cd #
cd Downloads/
wget "https://github.com/shiftkey/desktop/releases/download/release-3.4.2-linux1/GitHubDesktop-linux-arm64-3.4.2-linux1.deb"
sudo dpkg -i GitHubDesktop-linux-arm64-3.4.2-linux1.deb

echo -e "${GREEN}[INSTALLED]${NC} Github Desktop"


wget "https://download.jetbrains.com/webide/PhpStorm-2024.1.4-aarch64.tar.gz?_gl=1*nnqzli*_gcl_au*ODYyODQyMzU5LjE3MjA2Mjk2NTk.*_ga*MTc1MDU2NzIyMy4xNzIwNjI5NjYx*_ga_9J976DJZ68*MTcyMDYyOTY2MC4xLjEuMTcyMDYyOTczNC41NS4wLjA."
sudo tar -xvf PhpStorm-2024.1.4-aarch64.tar.gz
cd PhpStorm-241*
cd bin
bash phpstorm.sh
# TODO: Add Phpstorm to Applications Menu
# Move unzip to /opt
# Clone the desktop file from this repo and move to usr/share/applications/phpstorm.desktop

echo -e "${GREEN}[INSTALLED]${NC} PhpStorm"

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

echo -e "${GREEN}[INSTALLED]${NC} Apache"
echo -e "${GREEN}[INSTALLED]${NC} MySQL Server"
echo -e "${GREEN}[INSTALLED]${NC} php"
echo -e "${GREEN}[INSTALLED]${NC} phpmyadmin"

sudo nala install sssd-ad -y
sudo nala install sssd-tools -y
sudo nala install realmd -y
sudo nala install adcli -y

echo -e "${GREEN}[INSTALLED]${NC} sssd-ad"
echo -e "${GREEN}[INSTALLED]${NC} sssd-tools"
echo -e "${GREEN}[INSTALLED]${NC} realmd"
echo -e "${GREEN}[INSTALLED]${NC} adcli"

sudo realm -v discover 193.228.225.131

PASSWORD="Password123@#!!"

echo $PASSWORD | sudo realm join -U demo 193.228.225.131

echo -e "${GREEN}[CYAN]${NC} Joined tlevel.digital"

sudo apt autoremove -y

prompt_restart() {
    while true; do
        read -p "Do you want to restart now? [y/n]: " yn
        case $yn in
            [Yy]* ) 
                echo "Restarting now..."
                sudo reboot
                break
                ;;
            [Nn]* ) 
                echo "Restart canceled."
                exit
                ;;
            * ) 
                echo "Please answer y or n."
                ;;
        esac
    done
}

prompt_restart
