#!/bin/bash

apt_pkgs=(
  colordiff
  terminator
  vinagre
  vpnc
  network-manager-vpnc
  network-manager-vpnc-gnome
  wakeonlan
  openssh-server
  cifs-utils
  rar
  unrar
)

echo "Update apt-index..."
sudo apt update

for ((i=0; i<${#apt_pkgs[@]}; i++))
do
  sudo apt install -y ${apt_pkgs[$i]}
done

echo -e "\nInstall of apt-packages finished"
