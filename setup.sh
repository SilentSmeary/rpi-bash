RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
NOCOLOUR='\033[0m' # No Color

sudo apt install nala -y

sudo nala update
sudo nala upgrade -y

sudo nala remove transmission-gtk -y
sudo nala remove remmina -y
sudo nala remove gnome-snapshot -y
sudo nala remove rhythmbox -y

sudo nala install thonny -y 
sudo nala install python3-pandas -y
sudo nala install chromium-browser -y
sudo nala install okular -y
sudo nala install git -y

sudo rm -rf local-downloads
mkdir local-downloads

cd local-downloads/
wget "https://github.com/shiftkey/desktop/releases/download/release-3.4.2-linux1/GitHubDesktop-linux-arm64-3.4.2-linux1.deb"
sudo dpkg -i GitHubDesktop-linux-arm64-3.4.2-linux1.deb

# wget "https://download.jetbrains.com/webide/PhpStorm-2024.1.4-aarch64.tar.gz"
# sudo tar -xvf PhpStorm-2024.1.4-aarch64.tar.gz
# mv PhpStorm-241.18034.69 PhpStorm
# sudo mv /rpi-bash/local-downloads/PhpStorm /opt/
# sudo wget "https://raw.githubusercontent.com/SilentSmeary/rpi-bash/main/phpstorm.desktop"
# sudo mv /rpi-bash/local-downloads/phpstorm.desktop /usr/share/applications/
# sudo chmod +x /usr/share/applications/phpstorm.desktop

sudo snap install phpstorm --classic

sudo wget "http://192.168.1.99:8000/projectlibre_1.9.3-1.deb"
sudo dpkg -i projectlibre_1.9.3-1.deb
sudo apt --fix-broken install -y

# TODO: Add this later when i've configured mysql server
# sudo mv phpmyadmin/ /opt/
# sudo mv /.desktop/phpmyadmin.desktop /usr/share/applications/
# sudo chmod +x /usr/share/applications/phpmyadmin.desktop

sudo nala update
sudo nala upgrade -y

sudo nala install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2

sudo nala install php libapache2-mod-php php-mysql -y

sudo nala install sssd-ad -y
sudo nala install sssd-tools -y
sudo nala install realmd -y
sudo nala install adcli -y

nmcli connection show

sudo nmcli connection modify 'James_Extender' ipv4.dns "193.228.225.131 8.8.8.8"
sudo nmcli connection modify 'James_Extender' ipv4.ignore-auto-dns yes

sudo systemctl restart NetworkManager

nmcli connection show 299b68dc-f772-457d-a4f1-737100455fa7 | grep ipv4.dns:

sudo realm -v discover 193.228.225.131
PASSWORD="Password123@#!!"
echo $PASSWORD | sudo realm join -U demo 193.228.225.131

sudo rm -rf local-downloads

sudo apt autoremove -y

echo -e "${YELLOW}[SYSTEM]${NOCOLOUR} Upgraded"
echo ""
echo -e "${GREEN}[INSTALLED]${NOCOLOUR} Nala"
echo -e "${GREEN}[INSTALLED]${NOCOLOUR} Thonny"
echo -e "${GREEN}[INSTALLED]${NOCOLOUR} Pandas"
echo -e "${GREEN}[INSTALLED]${NOCOLOUR} Chormium Browser"
echo -e "${GREEN}[INSTALLED]${NOCOLOUR} Okular"
echo -e "${GREEN}[INSTALLED]${NOCOLOUR} Git"
echo -e "${GREEN}[INSTALLED]${NOCOLOUR} Github Desktop"
echo -e "${GREEN}[INSTALLED]${NOCOLOUR} PhpStorm"
echo -e "${GREEN}[INSTALLED]${NOCOLOUR} Apache"
echo -e "${GREEN}[INSTALLED]${NOCOLOUR} MySQL Server"
echo -e "${GREEN}[INSTALLED]${NOCOLOUR} php"
echo -e "${GREEN}[INSTALLED]${NOCOLOUR} phpmyadmin"
echo -e "${GREEN}[INSTALLED]${NOCOLOUR} sssd-ad"
echo -e "${GREEN}[INSTALLED]${NOCOLOUR} sssd-tools"
echo -e "${GREEN}[INSTALLED]${NOCOLOUR} realmd"
echo -e "${GREEN}[INSTALLED]${NOCOLOUR} adcli"
echo ""
echo -e "${RED}[REMOVED]${NOCOLOUR} Transmission"
echo -e "${RED}[REMOVED]${NOCOLOUR} Remmina"
echo -e "${RED}[REMOVED]${NOCOLOUR} Camera"
echo -e "${RED}[REMOVED]${NOCOLOUR} Unused Packages"
echo ""
echo -e "${CYAN}[DOMAIN]${NOCOLOUR} Joined tlevel.digital domain"
echo ""

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
                echo "Restart stopped."
                exit
                ;;
            * ) 
                echo "Please answer y or n."
                ;;
        esac
    done
}

prompt_restart
