#!/bin/bash

apt_pkgs=(
  cifs-utils
  colordiff
  libdvd-pkg
  network-manager-vpnc
  network-manager-vpnc-gnome
  openssh-server
  rar
  terminator
  unrar
  vinagre
  vlc
  vpnc
  wakeonlan
)

echo "Update apt-index..."
sudo apt update

for ((i=0; i<${#apt_pkgs[@]}; i++))
do
  sudo apt install -y ${apt_pkgs[$i]}
done

echo -e "\nInstall of apt-packages finished"
