#!/bin/bash

apt_pkgs=(
  terminator
  byobu
)

for ((i=0; i<${#apt_pkgs[@]}; i++))
do
  sudo apt install ${apt_pkgs[$i]}
done

echo -e "\nInstall of apt packages finished"
