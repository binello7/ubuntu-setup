#!/bin/bash

apt_pkgs=(
  byobu
  colordiff
  libgdal1i
  libgdal1-dev
  libgdal-dev
  terminator
  virtualenv
  vinagre
  vpnc
  network-manager-vpnc
  network-manager-vpnc-gnome
  polybox-client
  libimage-exiftool-perl
  wakeonlan
  openssh-server
  qgis
  qgis-plugin-grass
  cifs-utils
  rar
  unrar
  pdfshuffler
)

echo "Add new repositories to sources.list..."
echo 'deb http://polybox.ethz.ch/repo/Ubuntu_18.04/ /' | sudo tee -a /etc/apt/sources.list.d/polybox-client.list
echo -e '\ndeb https://qgis.org/ubuntu bionic main' | sudo tee -a /etc/apt/sources.list

echo "Add repositories keys..."
wget http://polybox.ethz.ch/repo/Ubuntu_18.04/Release.key
sudo apt-key add - < Release.key
rm Release.key
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key 51F523511C7028C3

echo "Update apt-index..."
sudo apt update

for ((i=0; i<${#apt_pkgs[@]}; i++))
do
  sudo apt install ${apt_pkgs[$i]}
done

echo -e "\nInstall of apt-packages finished"
