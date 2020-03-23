#!/bin/bash

apt_install=(
  byobu
  cifs-utils
  colordiff
  git-gui
  kazam
  libgdal-dev
  libgdal1-dev
  libgdal1i
  libimage-exiftool-perl
  network-manager-vpnc
  network-manager-vpnc-gnome
  net-tools
  openssh-client
  openssh-server
  pdfshuffler
  polybox-client
  python3-venv
  qgis
  qgis-plugin-grass
  rar
  r-base
  shutter
  terminator
  unrar
  vinagre
  virtualenv
  vpnc
  wakeonlan
)

echo "Add new repositories to sources.list..."
echo 'deb http://polybox.ethz.ch/repo/Ubuntu_18.04/ /' | sudo tee -a /etc/apt/sources.list.d/polybox-client.list
echo -e '\ndeb https://qgis.org/ubuntu bionic main' | sudo tee -a /etc/apt/sources.list
sudo add-apt-repository ppa:linuxuprising/shutter
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'

echo "Add repositories keys..."
wget http://polybox.ethz.ch/repo/Ubuntu_18.04/Release.key
sudo apt-key add - < Release.key
rm Release.key
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key 51F523511C7028C3
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

echo "Update apt-index..."
sudo apt update

for pkg in ${apt_install[@]}
do
  sudo apt install -y $pkg
done

echo -e "\nInstall of apt-packages finished"
