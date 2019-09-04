#!/bin/bash

apt_pkgs=(
  byobu
  libgdal1i
  libgdal1-dev
  libgdal-dev
  terminator
  virtualenv
  vinagre
)

for ((i=0; i<${#apt_pkgs[@]}; i++))
do
  sudo apt install ${apt_pkgs[$i]}
done

echo -e "\nInstall of apt-packages finished"
