#!/bin/bash

apt_pkgs=(
  byobu
  cifs-utils
  colordiff
  git-gui
  kazam
  libgdal-dev
  libgdal1-dev
  libgdal1i
  libimage-exiftool-perl
  libspatialindex-dev
  network-manager-openvpn
  network-manager-openvpn-gnome
  network-manager-vpnc
  network-manager-vpnc-gnome
  net-tools
  openssh-client
  openssh-server
  python3-venv
  qgis
  qgis-plugin-grass
  rar
  r-base
  shutter
  terminator
  texlive-font-utils
  unrar
  vinagre
  virtualenv
  vpnc
  wakeonlan
)

echo "Add new repositories to sources.list..."
echo -e '\ndeb https://qgis.org/ubuntu bionic main' | sudo tee -a /etc/apt/sources.list
sudo add-apt-repository ppa:linuxuprising/shutter
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'

echo "Add repositories keys..."
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key 51F523511C7028C3
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

echo "Update apt-index..."
sudo apt update

for pkg in ${apt_pkgs[@]}
do
  sudo apt install -y $pkg
done

echo -e "\nInstall of apt-packages finished"
