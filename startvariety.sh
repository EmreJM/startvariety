tput -T xterm setaf 6

echo " This script will initialize/change next settings: "
echo " "
echo " - Changes keyboard layout to finnish "
echo " - Installs updates "
echo " - Installs git "
echo " - Installs puppet "
echo " - Copies variety module from https://github.com/EmreJM/variety.git "
echo " - Moves module to where it should be which is /etc/puppet/modules "
echo " - Applies the variety module "

tput -T xterm sgr0

setxkbmap -layout fi
sudo apt-get update
sudo apt-get install -y git puppet
git clone https://github.com/EmreJM/variety.git
cd variety
sudo cp -R  variety /etc/puppet/modules/
cd
sudo puppet apply -e 'class {"variety":}'
mkdir vagrantpp && cd vagrantpp && > Vagrantfile
git clone https://github.com/EmreJM/vagrantpp.git
cd vagrantpp && sudo cp -R  vagrantpp /etc/puppet/modules/
sudo puppet apply -e 'class {"vagrantpp":}'

tput -T xterm setaf 6

echo " Done!"

tput -T xterm sgr0
