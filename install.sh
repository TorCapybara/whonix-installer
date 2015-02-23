#!/bin/sh
#
# Bootstrap script before ruby is installed...
#
# This will only have step by step commands which could be issued by hand as esily
#


if test "$(id -u)" -eq "0"
then
    echo "Do not run this script as root!" >&2
    exit 1

echo 'Welcome to the automatic setup for whonix (9.6+) to run ruby on rails in production settings (lolib/RHF/sanctuary/GHG)'
echo "You will be asked for your sudo password now:"

sudo apt-get update
sudo apt-get install -f
sudo apt-get dist-upgrade

sudo update-command-not-found

sudo apt-get --yes install openssh-client
sudo apt-get --yes install unattended-upgrades apt-listchanges
sudo dpkg-reconfigure -plow unattended-upgrades
sudo apt-get --yes install git
sudo apt-get -yes install ruby

echo "Installed Ruby Version - we will switch to rvm soon"
ruby --version

# Install rvm and a current ruby
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby

fi

source ~/.rvm/scripts/rvm

echo "RVM Ruby Version used"
ruby --version

cd ~

mkdir Repositories -p
git clone git@github.com:TorCapybara/whonix-installer.git
cd whonix-installer

ruby whonix-installer.rb

exit 0
