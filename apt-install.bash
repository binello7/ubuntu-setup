#!/bin/bash

apt_install=(
  cifs-utils
  colordiff
  handbrake
  libdvd-pkg
  network-manager-vpnc
  network-manager-vpnc-gnome
  net-tools
  openssh-client
  openssh-server
  rar
  terminator
  ubuntu-restricted-extras
  unrar
  vinagre
  vlc
  vpnc
  wakeonlan
)

apt_purge=(
  totem
)

echo "Update apt-index..."
sudo apt update

for pkg in ${apt_install[@]}
do
  sudo apt install -y $pkg
done
echo -e "\nInstall of apt-packages finished"

for pkg in "${apt_purge[@]}"
do
  sudo apt purge -y $pkg
done
echo -e "\nPurge of apt-packages finished"
