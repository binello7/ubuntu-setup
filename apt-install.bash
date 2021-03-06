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
  openssh-client
  openssh-server
  owncloud-client
  pdfshuffler
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
  vlc
  vpnc
  wakeonlan
  wine-stable
)

echo "Add new repositories to sources.list..."
echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/Ubuntu_18.04/ /' | sudo tee -a /etc/apt/sources.list.d/isv:ownCloud:desktop.list
echo -e '\ndeb https://qgis.org/ubuntu bionic main' | sudo tee -a /etc/apt/sources.list
sudo add-apt-repository ppa:linuxuprising/shutter
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'

echo "Add repositories keys..."
curl -fsSL https://download.opensuse.org/repositories/isv:ownCloud:desktop/Ubuntu_18.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/isv:ownCloud:desktop.gpg > /dev/null
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key 51F523511C7028C3
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

echo "Update apt-index..."
sudo apt update

for pkg in ${apt_install[@]}
do
  sudo apt install -y $pkg
done

echo -e "\nInstall of apt-packages finished"
