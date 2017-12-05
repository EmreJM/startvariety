tput -T xterm setaf 6

echo " This script will initialize/change next settings: "
echo " "
echo " - Changes keyboard layout to finnish "
echo " - Installs updates "
echo " - Installs git "
echo " - Installs puppet "
echo " - A Vagrantfile will be created under /vagrant "
echo " - Copies vagrantpp module from https://github.com/EmreJM/vagrantpp "
echo " - Moves module to where it should be which is /etc/puppet/modules "
echo " - Applies the vagrantpp module "
echo " - Configures the machines "
echo " - slave01 is on centos-7.3 "
echo " - slave02 is on fedora-26 "
echo " - slave03 is on debian-8.1 "

tput -T xterm sgr0

setxkbmap -layout fi
sudo apt-get update
sudo apt-get install -y git puppet
mkdir vagrant && cd vagrant && > Vagrantfile
cd
git clone https://github.com/EmreJM/vagrantpp.git
cd vagrantpp && sudo cp -R  vagrantpp /etc/puppet/modules/
sudo puppet apply -e 'class {"vagrantpp":}'
vagrant up

tput -T xterm setaf 6

echo " Done!"

tput -T xterm sgr0
